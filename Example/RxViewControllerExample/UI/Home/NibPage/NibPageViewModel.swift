//
//  NibPageViewModel.swift
//  RxViewControllerExample
//
//  Created by Bugking on 2021/06/07.
//

import Foundation
import RxViewController
import RxSwift
import RxCocoa

final class NibPageViewModel: RxViewModel {

    struct Input {
    }

    struct Output {
        let titleText: BehaviorRelay<String>
    }

    let input: Input = .init()
    let title: String

    init(title: String) {
        self.title = title
        super.init(nibName: "NibPageView", bundle: .main)
    }

    func transform() -> Output {
        let output: Output = .init(titleText: .init(value: title))
        debugPrint(title)
        return output
    }
}
