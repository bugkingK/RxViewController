//
//  NibPageViewController.swift
//  RxViewControllerExample
//
//  Created by Bugking on 2021/06/07.
//

import UIKit
import RxViewController

class NibPageView: RxView<NibPageViewModel> {
    @IBOutlet private var testButton: UIButton!

    override func layout() {
        super.layout()
    }

    override func bind(_ viewModel: NibPageViewModel) {
        super.bind(viewModel)
        let output = viewModel.transform()
//        output.titleText.bind(to: rx.title).disposed(by: disposeBag)
    }
}
