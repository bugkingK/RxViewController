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
        let root1: StoryboardViewController = .instantiate(viewModel: .init(title: "StoryboardPage"))
        let root2: XibViewController = .instantiate(viewModel: .init(title: "XibPage"))
        let root3: CodeViewController = .init(viewModel: .init(title: "Code"))
        let nav1: UINavigationController = .init(rootViewController: root1)
        let nav2: UINavigationController = .init(rootViewController: root2)
        let nav3: UINavigationController = .init(rootViewController: root3)
//        let tab: CodeTabBarController = .init(viewModel: .init(title: "Tabbar"))
        let tab: StoryboardTabBarController = .instantiate(viewModel: .init(title: "Storyboard"))

        tab.viewControllers = [nav1, nav3, nav2]
        window?.rootViewController = tab
        window?.makeKeyAndVisible()
        return true
    }
}
