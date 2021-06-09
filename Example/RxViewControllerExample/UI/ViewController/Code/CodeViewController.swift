//
//  CodeViewController.swift
//  RxViewControllerExample
//
//  Created by Bugking on 2021/06/08.
//

import UIKit
import RxViewController

final class CodeViewController: RxViewController<CodeViewModel> {

    override func layout() {
        super.layout()
        view.backgroundColor = .yellow
    }

    override func bind(_ viewModel: CodeViewModel) {
        super.bind(viewModel)
        let output = viewModel.transform()
        output.titleText.bind(to: rx.title).disposed(by: disposeBag)
    }
}
