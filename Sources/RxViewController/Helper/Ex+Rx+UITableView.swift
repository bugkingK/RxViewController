//
//  Ex+Rx+UITableView.swift
//  
//
//  Created by Bugking on 2021/05/31.
//

import RxCocoa
import RxSwift
import UIKit

public extension Reactive where Base: UITableView {

    /// Bind with tableHeaderView. If RxTableViewCell, call bind(CellModel).
    var headerView: Binder<RxCellModel> {
        return Binder(self.base) { b, v in
            if let cell = b.dequeueReusableCell(withIdentifier: v.cellID) as? RxTableViewCell {
                cell.bind(v)
                b.tableHeaderView = cell.contentView
            }
        }
    }

    /// Bind with tableFooterView. If RxTableViewCell, call bind(CellModel).
    var footerView: Binder<RxCellModel> {
        return Binder(self.base) { b, v in
            if let cell = b.dequeueReusableCell(withIdentifier: v.cellID) as? RxTableViewCell {
                cell.bind(v)
                b.tableFooterView = cell.contentView
            }
        }
    }

    /**
     Bind with CellModel. If RxTableViewCell, call bind(CellModel).

    - parameter source: Observable sequence of items.
    - returns: Disposable object that can be used to unbind.

     Example:

         let items: [CellModel] = []
         Observable.just(items).bind(to: tableView.rx.cells).disposed(by: disposeBag)

    */
    func cells<Sequence: Swift.Sequence, Source: ObservableType>
        (_ source: Source)
        -> Disposable
        where Source.Element == Sequence {
        return items(source)({ tv, row, element -> UITableViewCell in
            guard let model: RxCellModel = element as? RxCellModel,
                  let cell: UITableViewCell = tv.dequeueReusableCell(withIdentifier: model.cellID) else {
                return .init()
            }

            model.row = row
            Log.print(d: cell is RxTableViewCell)
            Log.print(d: cell is RxTableViewCell<RxCellModel>)
            Log.print(d: cell)
//            if cell is RxTableViewCell {
//                cell.bind(model)
//            }

            return cell
        })
    }

    /**
     Bind with CellModel. If RxTableViewCell, call bind(CellModel).

    - parameter source: Observable sequence of items.
    - returns: Disposable object that can be used to unbind.

     Example:

         let items: [CellModel] = []
         let defaultCellModel: CellModel = .init(cellID: "DefaultCellModel")
         Observable.just(items).bind(to: tableView.rx.cells)(defaultCellModel).disposed(by: disposeBag)

    */
    func cells<Sequence: Swift.Sequence, Source: ObservableType>
        (_ source: Source)
        -> (_ empty: RxCellModel)
        -> Disposable
        where Source.Element == Sequence {
        return { empty in
            return items(source)({ tv, row, element -> UITableViewCell in
                guard let model: RxCellModel = element as? RxCellModel,
                      let cell: UITableViewCell = tv.dequeueReusableCell(withIdentifier: model.cellID) else {
                    if let emptyCell = tv.dequeueReusableCell(withIdentifier: empty.cellID) {
                        empty.row = row
                        return emptyCell
                    } else {
                        fatalError("The Empty CellModel's ID was not found in TableView. Please check your ID.")
                    }
                }
                model.row = row
                if let cell = cell as? RxTableViewCell {
                    cell.bind(model)
                }

                return cell
            })
        }
    }
}

