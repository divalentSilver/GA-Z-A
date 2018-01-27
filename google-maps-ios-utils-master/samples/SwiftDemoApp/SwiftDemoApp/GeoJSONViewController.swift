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
    
    if let path = Bundle.main.path(forResource: "HangJeongDong_ver2017xxxx_for update", ofType: "geojson"), let data = NSData(contentsOfFile: path) {
        do {
            //let jsonString = try? String(contentsOfFile: path, encoding: String.Encoding.utf8)
            let jsonData = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments)
        }
        catch{
            print("error")
        }
    }

    //let json = JSON(data: jsonData as! Data)
    
    var yourPoint = CLLocationCoordinate2DMake(0, 0)
    //var pathOfPolygon =
    
    /*
    if GMSGeometryContainsLocation(yourPoint, pathOfPolygon, true) {
        print("YES: you are in this polygon.")
    } else {
        print("You do not appear to be in this polygon.")
    }
    */
  }
}
