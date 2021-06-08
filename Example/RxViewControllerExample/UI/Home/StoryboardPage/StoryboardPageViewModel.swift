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

final class StoryboardPageViewModel: RxViewModel, ViewModelProtocol {

    struct Input {
    }

    struct Output {
        let titleText: BehaviorRelay<String>
        let cells: BehaviorRelay<[RxCellModel]> = .init(value: [])
    }

    let input: Input = .init()
    let title: String

    init(title: String) {
        self.title = title
        super.init(storyboardID: "StoryboardPage")
    }

    func transform() -> Output {
        let output: Output = .init(titleText: .init(value: title))
        output.cells.accept([StoryboardPageCellModel(title: "1"),
                             StoryboardPageCellModel(title: "2"),
                             StoryboardPageCellModel(title: "3")])
        return output
    }
}
