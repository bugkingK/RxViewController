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
//        let root: StoryboardPageViewController = .instantiate(viewModel: .init(title: "StoryboardPage"))
//        let root: XibViewController = .instantiate(viewModel: .init(title: "title"))
        let root: CodeViewController = .init(viewModel: .init(title: "Code"))
        let nav: UINavigationController = .init(rootViewController: root)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        return true
    }
}
