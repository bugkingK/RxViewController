//
//  StoryboardPageViewController.swift
//  RxViewControllerExample
//
//  Created by Bugking on 2021/05/31.
//

import UIKit
import RxViewController

final class StoryboardPageViewController: RxViewController<StoryboardPageViewModel> {
    @IBOutlet private weak var tableView: UITableView!

    override func layout() {
        super.layout()
        tableView.register(.init(nibName: "StoryboardPageCell", bundle: .main), forCellReuseIdentifier: "StoryboardPageCell")
    }

    override func bind(_ viewModel: StoryboardPageViewModel) {
        super.bind(viewModel)
        let output = viewModel.transform()
        output.titleText.bind(to: rx.title).disposed(by: disposeBag)
        output.cells.bind(to: tableView.rx.cells).disposed(by: disposeBag)
    }

}
