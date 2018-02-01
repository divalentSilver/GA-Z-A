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
        polygon.fillColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.1);
        polygon.strokeColor = .black
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
                    return
                }
                
            }
        }
    }
    
    func stringToDate(stringDate: String) -> Date{
        let dateString = stringDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        // The below line is optional, as NSDate uses the GMT +0 timezone by default
        // The output day may be slightly off due your timezone
        // This will align it with the NSDate timezone default GMT + 0
        // Keep in mind users of your app all have different timezones and this will make the date use GMT+0 timezone instead of a users local one
        
        dateFormatter.timeZone = NSTimeZone(abbreviation: "GMT+0:00") as TimeZone!
        let dateFromString = dateFormatter.date(from: dateString)
        return dateFromString!
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (latestPhotoAssetsFetched?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PictureCollectionViewCell
        
        // Get the asset. If nothing, return the cell.
        guard let asset = self.latestPhotoAssetsFetched?[indexPath.item] else {
            return cell
        }
        // Here we bind the asset with the cell.
        cell.representedAssetIdentifier = asset.localIdentifier
        // Request the image.
        PHImageManager.default().requestImage(for: asset,targetSize: cell.photo.frame.size,                                        contentMode: .aspectFill, options: nil) { (image, _) in
            // By the time the image is returned, the cell may has been recycled.
            // We update the UI only when it is still on the screen.
            if cell.representedAssetIdentifier == asset.localIdentifier {
                cell.photo.image = image
            }
        }
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapView()
        //self.collectionView.delegate = self
        //self.collectionView.dataSource = self
    }
    
    fileprivate func setupMapView() {
        /*
        let camera = GMSCameraPosition.camera(withLatitude: 37.574832, longitude: 126.969185, zoom: 12)
        mapView = GMSMapView.map(withFrame: CGRect.init(x: 0, y: 20, width: 375, height: 647), camera: camera)
        self.view.addSubview(mapView)
        
        
        let path = Bundle.main.path(forResource: "HangJeongDong_ver2017xxxx_for update", ofType: "geojson")
        let data = NSData(contentsOfFile: path!)
        let json = JSON(data! as Data)
 
        
        var startDate = stringToDate(stringDate: "2018-01-22")
        var endDate = stringToDate(stringDate: "2018-02-01")
        
        self.latestPhotoAssetsFetched = self.fetchPhotosInRange(startDate: startDate as! NSDate, endDate: endDate as! NSDate)
        
        
        for i in 0..<self.latestPhotoAssetsFetched!.count{
            let asset = self.latestPhotoAssetsFetched![i]
            //print("date = \(asset.creationDate!)")
            print("location = \(asset.location!.coordinate.latitude)")
            print("location = \(asset.location!.coordinate.longitude)")
            findPolygonIncludingPoint(lat: (asset.location!.coordinate.latitude), long: (asset.location!.coordinate.longitude), json: json)
        }
        
        */
        self.latestPhotoAssetsFetched = self.fetchLatestPhotos(forCount: 2)
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
        
        let imgManager = PHImageManager.default()
        
        let requestOptions = PHImageRequestOptions()
        requestOptions.isSynchronous = true
        requestOptions.isNetworkAccessAllowed = true
        
        let fetchOptions = PHFetchOptions()
        fetchOptions.predicate = NSPredicate(format: "creationDate >= %@ AND creationDate <= %@", startDate, endDate)
        
        images = []
        let fetchResult: PHFetchResult = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: fetchOptions)
        if fetchResult.count > 0{
            for index in 0..<fetchResult.count {
                let asset = fetchResult.object(at: index)
                imgManager.requestImageData(for: asset, options: requestOptions, resultHandler: {(imageData: Data?, dataUTI: String?, orientation: UIImageOrientation, info: [AnyHashable: Any]?) -> Void in
                    if let imageData = imageData {
                        if let image = UIImage(data: imageData) {
                            self.images += [image]
                        }
                    }
                    if self.images.count == fetchResult.count {
                        //Do something once all the images have been fetched
                        print(self.images)
                    }
                })
            }
        }
        /*
         for i in 0 ..< result.count {
         let asset = result[i]
         print("date = \(asset.creationDate!)")
         print("location = \(asset.location!)")
         }
         */
        return fetchResult
        
    }
    
    func readJSONObject(object: [String: AnyObject]){
        
    }
}
