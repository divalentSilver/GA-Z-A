//
//  AppDelegate.swift
//  Travel
//
//  Created by cscoi044 on 2018. 1. 17..
//  Copyright © 2018년 lollol. All rights reserved.
//
import CoreLocation
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var posts: [Post] = []


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
    
        let picture1_1 = Picture(picDate: Date(), picLocation: CLLocationCoordinate2DMake(37.574832, 126.969185), picImage: #imageLiteral(resourceName: "IMG_2119"))
        let picture2_1 = Picture(picDate: Date(), picLocation: CLLocationCoordinate2DMake(37.9487, 127.7501), picImage: #imageLiteral(resourceName: "IMG_0997"))
        let picture2_2 = Picture(picDate: Date(), picLocation: CLLocationCoordinate2DMake(37.9487, 127.7501), picImage: #imageLiteral(resourceName: "IMG_1004"))
        let picture3_1 = Picture(picDate: Date(), picLocation: CLLocationCoordinate2DMake(34.7693, 128.71), picImage: #imageLiteral(resourceName: "IMG_6790"))
        let picture3_2 = Picture(picDate: Date(), picLocation: CLLocationCoordinate2DMake(37.5569, 126.9365), picImage: #imageLiteral(resourceName: "IMG_0821"))
        let picture4_1 = Picture(picDate: Date(), picLocation: CLLocationCoordinate2DMake(37.5569, 126.9366), picImage: #imageLiteral(resourceName: "IMG_0818"))
        let picture4_2 = Picture(picDate: Date(), picLocation: CLLocationCoordinate2DMake(37.5568, 126.9365), picImage: #imageLiteral(resourceName: "IMG_0820"))
        let picture4_3 = Picture(picDate: Date(), picLocation: CLLocationCoordinate2DMake(37.8763, 127.7113), picImage: #imageLiteral(resourceName: "IMG_1010"))
        
        
        
        let post1 = Post(pictures: [picture1_1], travelStartDate: Date(), travelEndDate: Date(), travelName: "Busan")
        let post2 = Post(pictures: [picture2_1, picture2_2], travelStartDate: Date(), travelEndDate: Date(), travelName: "Chuncheon")
        let post3 = Post(pictures: [picture3_1, picture3_2], travelStartDate: Date(), travelEndDate: Date(), travelName: "Sinchon")
        let post4 = Post(pictures: [picture4_1, picture4_2, picture4_3, travelStartDate,: Date(), travelEndDate: Date(), travelName: "Itaewon"])
        
        posts.append(post1)
        posts.append(post2)
        posts.append(post3)
        posts.append(post4)
        
        
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

