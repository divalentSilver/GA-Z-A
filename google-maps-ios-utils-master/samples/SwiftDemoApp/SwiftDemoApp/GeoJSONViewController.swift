/* Copyright (c) 2017 Google Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import UIKit
import GoogleMaps
import SwiftyJSON
import Photos



class GeoJSONViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

/////AddButton 추가
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var uiMapView: UIView!
    
    private var mapView: GMSMapView!
    private var renderer: GMUGeometryRenderer!
    private var geoJsonParser: GMUGeoJSONParser!

    var latestPhotoAssetsFetched: PHFetchResult<PHAsset>? = nil
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func isPointInPolygon(point: CLLocationCoordinate2D, path: GMSMutablePath) -> Bool{
        if GMSGeometryContainsLocation(point, path, true) {
            return true
        } else {
            return false
        }
    }
    
    
    func colorPolygon(path: GMSMutablePath){
        let polygon = GMSPolygon(path: path)
        polygon.fillColor = UIColor(red: 103/255, green: 82/255, blue: 193/255, alpha: 0.1);
        polygon.strokeColor = .purple
        polygon.strokeWidth = 2
        polygon.map = mapView
    }
    
    func findPolygonIncludingPoint(lat: Double, long: Double, json: JSON){
        let point = CLLocationCoordinate2DMake(lat, long)
        let admDistricts = json["features"]//행정구역들의 배열
        for j in 0..<admDistricts.count{
            let path = GMSMutablePath()
            let boundaries = admDistricts[j]["geometry"]["coordinates"]//하나의 행정구역의 polygon들의 배열
            for k in 0..<boundaries.count{
                let boundaryPoints = boundaries[k]//하나의 polygon의 경계점들의 배열
                for i in 0..<boundaryPoints.count{//경계점들로 path생성
                    path.add(CLLocationCoordinate2D(latitude: boundaryPoints[i][1].double!, longitude: boundaryPoints[i][0].double!))
                }
                if isPointInPolygon(point: point, path: path){
                    colorPolygon(path: path)
                    let marker = GMSMarker()
                    marker.position = CLLocationCoordinate2D(latitude: lat, longitude: long)
                    marker.icon = GMSMarker.markerImage(with: .purple)
                    marker.map = mapView
                    return
                }
                
            }
        }
    }
    
    func stringToDate(stringDate: String) -> Date{
        let dateString = stringDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = NSTimeZone(abbreviation: "GMT+9:00") as TimeZone!
        let dateFromString = dateFormatter.date(from: dateString)
        return dateFromString!
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (latestPhotoAssetsFetched?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PictureCollectionViewCell
        guard let asset = self.latestPhotoAssetsFetched?[indexPath.item] else {
            return cell
        }
        cell.representedAssetIdentifier = asset.localIdentifier
        PHImageManager.default().requestImage(for: asset,targetSize: cell.photo.frame.size,                                        contentMode: .aspectFill, options: nil) { (image, _) in
            if cell.representedAssetIdentifier == asset.localIdentifier {
                cell.photo.image = image
            }
        }
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapView()
    }
    
    fileprivate func setupMapView() {
        let camera = GMSCameraPosition.camera(withLatitude: 37.574832, longitude: 126.969185, zoom: 12)
        mapView = GMSMapView.map(withFrame: CGRect.init(x: 0, y: 20, width: 375, height: 647), camera: camera)
        self.view.addSubview(mapView)
        
        let path = Bundle.main.path(forResource: "HangJeongDong_ver2017xxxx_for update", ofType: "geojson")
        let data = NSData(contentsOfFile: path!)
        let json = JSON(data! as Data)
 
        var startDate = stringToDate(stringDate: "2018-01-31")
        var endDate = stringToDate(stringDate: "2018-02-01")
        self.latestPhotoAssetsFetched = self.fetchPhotosInRange(startDate: startDate as! NSDate, endDate: endDate as! NSDate)
        
        for i in 0..<self.latestPhotoAssetsFetched!.count{
            let asset = self.latestPhotoAssetsFetched![i]
            //print("location = \(asset.location!.coordinate.latitude)")
            //print("location = \(asset.location!.coordinate.longitude)")
            findPolygonIncludingPoint(lat: (asset.location!.coordinate.latitude), long: (asset.location!.coordinate.longitude), json: json)
        }
        
        //self.latestPhotoAssetsFetched = self.fetchLatestPhotos(forCount: 2)
        self.view.bringSubview(toFront: self.collectionView)
 
    }
    
    override func loadView() {
        super.loadView()
    }

    
    func fetchLatestPhotos(forCount count: Int?) -> PHFetchResult<PHAsset> {
        
        // Create fetch options.
        let options = PHFetchOptions()

        // If count limit is specified.
        if let count = count { options.fetchLimit = count }
        
        // Add sortDescriptor so the lastest photos will be returned.
        let sortDescriptor = NSSortDescriptor(key: "creationDate", ascending: false)
        options.sortDescriptors = [sortDescriptor]
        let result = PHAsset.fetchAssets(with: .image, options: options)
        
        // Fetch the photos.
        return result
        
    }
    var images: [UIImage] = []
    func fetchPhotosInRange(startDate: NSDate, endDate: NSDate) -> PHFetchResult<PHAsset> {
        //var newPost: Post = Post()
        let imgManager = PHImageManager.default()
        
        let requestOptions = PHImageRequestOptions()
        requestOptions.isSynchronous = true
        requestOptions.isNetworkAccessAllowed = true
        
        let fetchOptions = PHFetchOptions()
        fetchOptions.predicate = NSPredicate(format: "creationDate >= %@ AND creationDate <= %@", startDate, endDate)
        
        //posts.append(newPost)
        images = []
        let fetchResult: PHFetchResult = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: fetchOptions)
        
        if fetchResult.count > 0{
            for index in 0..<fetchResult.count {
                let asset = fetchResult.object(at: index)
                imgManager.requestImageData(for: asset, options: requestOptions, resultHandler: {(imageData: Data?, dataUTI: String?, orientation: UIImageOrientation, info: [AnyHashable: Any]?) -> Void in
                    if let imageData = imageData {
                        if let image = UIImage(data: imageData) {
                            self.images += [image]
                            //print("date = \(asset.creationDate!)")
                        }
                    }
                    /*
                    if self.images.count == fetchResult.count {
                        //Do something once all the images have been fetched
                        print(self.images)
                    }
                    */
                })
            }
        }
        return fetchResult
        
    }
    
    func readJSONObject(object: [String: AnyObject]){
        
    }
}
