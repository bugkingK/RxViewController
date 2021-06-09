//
//  StoryboardViewController.swift
//  RxViewControllerExample
//
//  Created by Bugking on 2021/05/31.
//

import UIKit
import RxViewController

final class StoryboardViewController: RxViewController<StoryboardViewModel> {
    @IBOutlet private weak var tableView: UITableView!

    override func bind(_ viewModel: StoryboardViewModel) {
        super.bind(viewModel)
        let output = viewModel.transform()
        output.titleText.bind(to: rx.title).disposed(by: disposeBag)
    }

}
