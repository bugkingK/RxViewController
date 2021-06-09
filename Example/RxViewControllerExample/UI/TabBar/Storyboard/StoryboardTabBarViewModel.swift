//
//  StoryboardTabBarViewModel.swift
//  RxViewControllerExample
//
//  Created by Bugking on 2021/06/09.
//

import Foundation
import RxViewController

final class StoryboardTabBarViewModel: RxViewModel {
    init(title: String) {
        super.init(storyboardID: "TabBar")
    }
}
