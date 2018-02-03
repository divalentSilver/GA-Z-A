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



class GeoJSONViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, GMSMapViewDelegate {


    
    @IBAction func addPostButton(_ sender: Any) {
    }
    
    @IBOutlet weak var mainBar: UINavigationBar!
    
    @IBOutlet weak var logo: UILabel!
    
    
    private var mapView: GMSMapView!
    private var renderer: GMUGeometryRenderer!
    private var geoJsonParser: GMUGeoJSONParser!
    var selectedPost: Post!
    

    //var latestPhotoAssetsFetched: PHFetchResult<PHAsset>? = nil
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func mapView(mapView: GMSMapView, didTapMarker marker: GMSMarker){
        for i in 0..<posts.count{
            for j in 0..<posts[i].pictures.count{
                if posts[i].pictures[j].marker == marker {
                    selectedPost = posts[i]
                }
            }
        }
    }
    
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
        polygon.strokeColor = .white
        polygon.strokeWidth = 0.3
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
        var selectedPost: Post! = posts[0]
        return selectedPost.pictures.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PictureCollectionViewCell
        var selectedPost: Post! = posts[0]
        cell.photo.image = selectedPost.pictures[indexPath.item].picImage
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "postSegue" {
            let cell = sender as! UICollectionViewCell
            let indexPath = collectionView.indexPath(for: cell)!
            let detailVC = segue.destination as! PostTableViewController
            detailVC.selectedIndex = indexPath.item
        }
    }
    /*
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = mainStoryBoard.instantiateViewController(withIdentifier: "StoryTableViewController") as! StoryTableViewController
        destinationVC.selectedIndex = indexPath.item
        var desVC =
        self.navigationController?.pushViewController(destinationVC, animated: true)
        
    }
 */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        setupMapView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    fileprivate func setupMapView() {
        let camera = GMSCameraPosition.camera(withLatitude: 37.574832, longitude: 126.969185, zoom: 12)
        mapView = GMSMapView.map(withFrame: CGRect.init(x: 0, y: 0, width: 375, height: 647), camera: camera)
        self.view.addSubview(mapView)
        
        let path = Bundle.main.path(forResource: "HangJeongDong_ver2017xxxx_for update", ofType: "geojson")
        let data = NSData(contentsOfFile: path!)
        let json = JSON(data! as Data)
        
        
        let startDate = stringToDate(stringDate: "2018-01-31")
        let endDate = stringToDate(stringDate: "2018-02-01")
        let postName = "Anam"
        saveNewData(startDate: startDate as NSDate, endDate: endDate as NSDate, postName: postName)
        //.self.latestPhotoAssetsFetched = self.fetchPhotosInRange(startDate: startDate as! NSDate, endDate: endDate as! NSDate)
        
        for i in 0..<posts.count{
            for j in 0..<posts[i].pictures.count{
                let asset = posts[i].pictures[j]
                findPolygonIncludingPoint(lat: (asset.picLocation!.latitude), long: (asset.picLocation!.longitude), json: json)
            }
            //let asset = self.latestPhotoAssetsFetched![i]
            //findPolygonIncludingPoint(lat: (asset.location!.coordinate.latitude), long: (asset.location!.coordinate.longitude), json: json)
        }

        //self.latestPhotoAssetsFetched = self.fetchLatestPhotos(forCount: 2)
        
        bringSubviewToFront()
 
    }
    
    func bringSubviewToFront(){
        self.view.bringSubview(toFront: self.collectionView)
        //self.view.bringSubview(toFront: self.mainBar)
        //self.view.bringSubview(toFront: self.logo)
    }
    
    override func loadView() {
        super.loadView()
    }

    
    func fetchLatestPhotos(forCount count: Int?) -> PHFetchResult<PHAsset> {
        let options = PHFetchOptions()
        if let count = count { options.fetchLimit = count }
        let sortDescriptor = NSSortDescriptor(key: "creationDate", ascending: false)
        options.sortDescriptors = [sortDescriptor]
        let result = PHAsset.fetchAssets(with: .image, options: options)
        
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
    
    func saveNewData(startDate: NSDate, endDate: NSDate, postName: String){
        var newPictures: [Picture] = []
        var newPost: Post = Post()
        
        let imgManager = PHImageManager.default()
        let requestOptions = PHImageRequestOptions()
        requestOptions.isSynchronous = true
        requestOptions.isNetworkAccessAllowed = true
        let fetchOptions = PHFetchOptions()
        fetchOptions.predicate = NSPredicate(format: "creationDate >= %@ AND creationDate <= %@", startDate, endDate)
        let fetchResult: PHFetchResult = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: fetchOptions)
        
        if fetchResult.count > 0{
            for index in 0..<fetchResult.count {
                let asset = fetchResult.object(at: index)
                imgManager.requestImageData(for: asset, options: requestOptions, resultHandler: {(imageData: Data?, dataUTI: String?, orientation: UIImageOrientation, info: [AnyHashable: Any]?) -> Void in
                    if let imageData = imageData {
                        if let image = UIImage(data: imageData) {
                            let newPicture: Picture = Picture()
                            newPicture.picDate = fetchResult[index].creationDate
                            newPicture.picLocation = CLLocationCoordinate2D(latitude: fetchResult[index].location!.coordinate.latitude, longitude: fetchResult[index].location!.coordinate.longitude)
                            newPicture.picImage = image
                            newPictures.append(newPicture)
                        }
                    }
                })
            }
        }
        newPost.pictures = newPictures
        newPost.travelStartDate = startDate as Date
        newPost.travelEndDate = endDate as Date
        newPost.travelName = postName
        posts.append(newPost)
        return
    }
    
    func readJSONObject(object: [String: AnyObject]){
        
    }
}
