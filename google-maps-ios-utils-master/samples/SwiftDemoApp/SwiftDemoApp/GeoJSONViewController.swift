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

import GoogleMaps
import UIKit
import SwiftyJSON



class GeoJSONViewController: UIViewController {
  private var mapView: GMSMapView!
  private var renderer: GMUGeometryRenderer!
  private var geoJsonParser: GMUGeoJSONParser!

  override func loadView() {
    let camera = GMSCameraPosition.camera(withLatitude: -28, longitude: 137, zoom: 4)
    mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
    self.view = mapView

    /*
    let path = Bundle.main.path(forResource: "HangJeongDong_ver2017xxxx_for update", ofType: "geojson")
    let url = URL(fileURLWithPath: path!)
    geoJsonParser = GMUGeoJSONParser(url: url)
    geoJsonParser.parse()

    renderer = GMUGeometryRenderer(map: mapView, geometries: geoJsonParser.features)

    renderer.render()
     */
    
    
    
    /*
    
    if let path = Bundle.main.path(forResource: "sample", ofType: "geojson"), let data = NSData(contentsOfFile: path) {
        do {
            
            
            let jsonData = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments)
            //print(jsonData)
            
            
            /*
            if let dictionary = jsonData as? [String: AnyObject]{
                print(dictionary)
            }
            */
            
        }
        catch{
            print("error")
        }
    }
*/
    //let json = JSON(data: jsonData as! Data)
    let path = Bundle.main.path(forResource: "sample", ofType: "geojson")
    let data = NSData(contentsOfFile: path!)
    let json = JSON(data! as Data)
    //print(json)
    //print(json["features"][0]["geometry"]["coordinates"][0][0])
    
    let yourPoint = CLLocationCoordinate2DMake(37.574832, 126.969185)
    let sajikdong = GMSMutablePath()
    let boundaryPoints = json["features"][0]["geometry"]["coordinates"][0]
    for i in 0..<boundaryPoints.count{
        //print("\(boundaryPoints[i][0]) \(boundaryPoints[i][1])")
        sajikdong.add(CLLocationCoordinate2D(latitude: boundaryPoints[i][1].double!, longitude: boundaryPoints[i][0].double!))
    }
    
    if GMSGeometryContainsLocation(yourPoint, sajikdong, true) {
        print("***YES: you are in this polygon.")
    } else {
        print("***You do not appear to be in this polygon.")
    }
    
  }
    
    func readJSONObject(object: [String: AnyObject]){
        
    }
}
