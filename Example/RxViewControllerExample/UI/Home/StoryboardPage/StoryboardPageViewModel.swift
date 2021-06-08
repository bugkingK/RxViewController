//
//  StoryboardPageViewModel.swift
//  RxViewControllerExample
//
//  Created by Bugking on 2021/05/31.
//

import Foundation
import RxViewController
import RxSwift
import RxCocoa

final class StoryboardPageViewModel: RxViewModel {

    struct Input {
    }

    struct Output {
        let titleText: BehaviorRelay<String>
    }

    let input: Input = .init()
    let title: String

    init(title: String) {
        self.title = title
        super.init(storyboardID: "StoryboardPage")
    }

    func transform() -> Output {
        let output: Output = .init(titleText: .init(value: title))
        return output
    }
}
