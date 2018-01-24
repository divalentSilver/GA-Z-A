//
//  RenderViewController.swift
//  GoogleMapAPIPractice
//
//  Created by KaEun Rhee on 2018. 1. 25..
//  Copyright © 2018년 KaEun Rhee. All rights reserved.
//

import GoogleMaps
import UIKit

class KMLViewController: UIViewController {
    private var mapView: GMSMapView!
    private var renderer: GMUGeometryRenderer!
    private var kmlParser: GMUKMLParser!
    //private var geoJsonParser: GMUGeoJSONParser!
    
    override func loadView() {
        let camera = GMSCameraPosition.camera(withLatitude: 37.4220, longitude: -122.0841, zoom: 17)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        self.view = mapView
        
        let path = Bundle.main.path(forResource: "KML_Sample", ofType: "kml")
        let url = URL(fileURLWithPath: path!)
        kmlParser = GMUKMLParser(url: url)
        kmlParser.parse()
        
        renderer = GMUGeometryRenderer(map: mapView,
                                       geometries: kmlParser.placemarks,
                                       styles: kmlParser.styles)
        
        renderer.render()
        print("view load")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View did load")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
