//
//  CodeTabBarViewModel.swift
//  RxViewControllerExample
//
//  Created by Bugking on 2021/06/09.
//

import Foundation
import RxViewController

final class CodeTabBarViewModel: RxViewModel {
    init(title: String) {
        debugPrint("cdoe", title)
        super.init()
    }
}
