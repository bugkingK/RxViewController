//
//  AppDelegate.swift
//  RxViewControllerExample
//
//  Created by Bugking on 2021/05/31.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = .init(frame: UIScreen.main.bounds)
        let root: StoryboardPageViewController = .instantiate(viewModel: .init(title: "StoryboardPage"))
        let nav: UINavigationController = .init(rootViewController: root)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        return true
    }
}
