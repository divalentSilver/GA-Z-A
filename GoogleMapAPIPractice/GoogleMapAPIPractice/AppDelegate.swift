//
//  AppDelegate.swift
//  GoogleMapAPIPractice
//
//  Created by KaEun Rhee on 2018. 1. 23..
//  Copyright © 2018년 KaEun Rhee. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var posts: [Post] = []

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        GMSServices.provideAPIKey("AIzaSyCSMb43WaYGG1PqFr2h_wIH8wtL86vPwcQ")
        
        
        let picture1_1 = Picture(picDate: Date(), picLocation: CLLocationCoordinate2DMake(37.574832, 126.969185), picImage: #imageLiteral(resourceName: "IMG_2119"))//2018-01-26
        let picture2_1 = Picture(picDate: Date(), picLocation: CLLocationCoordinate2DMake(37.9487, 127.7501), picImage: #imageLiteral(resourceName: "IMG_0997"))//2018-01-26
        let picture2_2 = Picture(picDate: Date(), picLocation: CLLocationCoordinate2DMake(37.9487, 127.7501), picImage: #imageLiteral(resourceName: "IMG_1004"))//2018-01-26
        let picture3_1 = Picture(picDate: Date(), picLocation: CLLocationCoordinate2DMake(34.7693, 128.71), picImage: #imageLiteral(resourceName: "IMG_6790"))//2018-01-26
        let picture3_2 = Picture(picDate: Date(), picLocation: CLLocationCoordinate2DMake(37.5569, 126.9365), picImage: #imageLiteral(resourceName: "IMG_0821"))//2018-01-26
        let picture4_1 = Picture(picDate: Date(), picLocation: CLLocationCoordinate2DMake(37.5569, 126.9366), picImage: #imageLiteral(resourceName: "IMG_0818"))//2018-01-26
        let picture4_2 = Picture(picDate: Date(), picLocation: CLLocationCoordinate2DMake(37.5568, 126.9365), picImage: #imageLiteral(resourceName: "IMG_0820"))//2018-01-26
        let picture4_3 = Picture(picDate: Date(), picLocation: CLLocationCoordinate2DMake(37.8763, 127.7113), picImage: #imageLiteral(resourceName: "IMG_1010"))//2018-01-26
        let picture5_1 = Picture(picDate: Date(), picLocation: CLLocationCoordinate2DMake(35.8635, 128.6077), picImage: #imageLiteral(resourceName: "IMG_1340"))//2017-02-05
        let picture5_2 = Picture(picDate: Date(), picLocation: CLLocationCoordinate2DMake(35.8639, 128.6079), picImage: #imageLiteral(resourceName: "IMG_6168"))//2018-01-26
        let picture6_1 = Picture(picDate: Date(), picLocation: CLLocationCoordinate2DMake(35.1598, 129.1643), picImage: #imageLiteral(resourceName: "IMG_1028"))//2017-01-16
        let picture6_2 = Picture(picDate: Date(), picLocation: CLLocationCoordinate2DMake(37.38, 126.6608), picImage: #imageLiteral(resourceName: "IMG_6556"))//2017-07-09
        let picture7_1 = Picture(picDate: Date(), picLocation: CLLocationCoordinate2DMake(35.85, 128.5673), picImage: #imageLiteral(resourceName: "IMG_1316"))//2017-02-04
        let picture7_2 = Picture(picDate: Date(), picLocation: CLLocationCoordinate2DMake(34.8651, 128.7236), picImage: #imageLiteral(resourceName: "IMG_6702"))//2017-07-15
        let picture7_3 = Picture(picDate: Date(), picLocation: CLLocationCoordinate2DMake(37.6903, 129.0354), picImage: #imageLiteral(resourceName: "IMG_2547"))//2017-11-08
        let picture8_1 = Picture(picDate: Date(), picLocation: CLLocationCoordinate2DMake(37.589, 127.0334), picImage: #imageLiteral(resourceName: "IMG_0681"))//2018-01-26
        let picture8_2 = Picture(picDate: Date(), picLocation: CLLocationCoordinate2DMake(37.589, 127.0333), picImage: #imageLiteral(resourceName: "IMG_0729"))//2018-01-26
        let picture8_3 = Picture(picDate: Date(), picLocation: CLLocationCoordinate2DMake(37.586, 127.6779), picImage: #imageLiteral(resourceName: "IMG_3635"))//2017-11-24
        
        
        
        
        let post1 = Post(pictures: [picture1_1], travelStartDate: Date(), travelEndDate: Date(), travelName: "Busan")
        let post2 = Post(pictures: [picture2_1, picture2_2], travelStartDate: Date(), travelEndDate: Date(), travelName: "Chuncheon")
        let post3 = Post(pictures: [picture3_1, picture3_2], travelStartDate: Date(), travelEndDate: Date(), travelName: "Sinchon")
        let post4 = Post(pictures: [picture4_1, picture4_2, picture4_3], travelStartDate: Date(), travelEndDate: Date(), travelName: "Itaewon")
        let post5 = Post(pictures: [picture5_1, picture5_2], travelStartDate: Date(), travelEndDate: Date(), travelName: "Deagu")
        let post6 = Post(pictures: [picture6_1, picture6_2], travelStartDate: Date(), travelEndDate: Date(), travelName: "Incheon")
        let post7 = Post(pictures: [picture7_1, picture7_2, picture7_3], travelStartDate: Date(), travelEndDate: Date(), travelName: "Namhae")
        let post8 = Post(pictures: [picture8_1, picture8_2, picture8_3], travelStartDate: Date(), travelEndDate: Date(), travelName: "Anam")
        
        posts.append(post1)
        posts.append(post2)
        posts.append(post3)
        posts.append(post4)
        posts.append(post5)
        posts.append(post6)
        posts.append(post7)
        posts.append(post8)
        
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

