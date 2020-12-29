//
//  AppDelegate.swift
//  PagingViewHB
//
//  Created by Habib Durodola on 2020-12-20.
//

import UIKit

class CustomNavigationController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()
        window?.makeKeyAndVisible()

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        self.window?.rootViewController = CustomNavigationController(rootViewController: ViewController(collectionViewLayout: layout))
        return true
    }


}

