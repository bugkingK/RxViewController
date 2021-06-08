//
//  StoryboardPageCell.swift
//  RxViewControllerExample
//
//  Created by Bugking on 2021/06/07.
//

import UIKit
import RxViewController

final class StoryboardPageCellModel: RxCellModel {
    fileprivate let titleText: String

    init(title: String) {
        titleText = title
        super.init("StoryboardPageCell")
    }
}

final class StoryboardPageCell: RxTableViewCell<StoryboardPageCellModel> {
    @IBOutlet private weak var titleLabel: UILabel!

    override func bind(_ viewModel: StoryboardPageCellModel) {
        super.bind(viewModel)
        titleLabel.text = viewModel.titleText
    }
}
