//
//  XibViewController.swift
//  RxViewControllerExample
//
//  Created by Bugking on 2021/06/08.
//

import UIKit
import RxViewController

final class XibViewController: RxViewController<XibViewModel> {

    override func layout() {
        super.layout()
        view.backgroundColor = .blue
    }

    override func bind(_ viewModel: XibViewModel) {
        super.bind(viewModel)
        let output = viewModel.transform()
        output.titleText.bind(to: rx.title).disposed(by: disposeBag)
    }
}
