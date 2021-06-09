//
//  CodeViewModel.swift
//  RxViewControllerExample
//
//  Created by Bugking on 2021/06/08.
//

import Foundation
import RxViewController
import RxCocoa

final class CodeViewModel: RxViewModel, ViewModelProtocol {
    struct Input {
    }

    struct Output {
        let titleText: BehaviorRelay<String>
    }

    let input: Input = .init()
    let title: String

    init(title: String) {
        self.title = title
        super.init()
    }

    func transform() -> Output {
        let output: Output = .init(titleText: .init(value: title))
        return output
    }
}
