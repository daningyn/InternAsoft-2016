//
//  AppDelegate.swift
//  MVVMDemo
//
//  Created by Danh Nguyen on 12/16/16.
//  Copyright © 2016 Danh Nguyen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let cars: [CarViewModel] = {
        let hondaCar = Car(model: "Honda Civic", make: "Honda", kilowatts: 174, photoURL: "http://buyersguide.caranddriver.com/media/assets/submodel/7587.jpg")
        let mazdaCar = Car(model: "Mazda 6", make: "Mazda", kilowatts: 184, photoURL: "http://static.usnews.rankingsandreviews.com/images/Auto/izmo/i6336193/2017_mazda_mazda6_angularfront.jpg")
        return [CarViewModel(car: hondaCar), CarViewModel(car: mazdaCar)]
    }()
    
    class var shareInstanced: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.window?.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        self.window?.rootViewController = CarViewController(nibName: "CarViewController", bundle: nil)
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

