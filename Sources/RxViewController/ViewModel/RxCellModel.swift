//
//  RxCellModel.swift
//  
//
//  Created by Bugking on 2021/05/31.
//

import Foundation
import RxSwift

open class RxCellModel: RxViewModel {
    let cellID: String
    /// The value of row is added when connecting to tableView.rx.cells.
    public var row: Int?

    public init(_ cellIdentifier: String) {
        self.cellID = cellIdentifier
        super.init()
    }

    deinit { }
}
