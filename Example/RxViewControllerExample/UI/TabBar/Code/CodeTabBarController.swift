//
//  CodeTabBarController.swift
//  RxViewControllerExample
//
//  Created by Bugking on 2021/06/09.
//

import UIKit
import RxViewController

final class CodeTabBarController: RxTabBarController<CodeTabBarViewModel> {

    override func layout() {
        super.layout()
        tabBar.backgroundColor = .blue
    }
}
