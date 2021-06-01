//
//  File.swift
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

    public init(cellID: String) {
        self.cellID = cellID
        super.init()
    }

    deinit { }
}
