//
//  File.swift
//  
//
//  Created by Bugking on 2021/05/31.
//

import UIKit
import RxSwift
import RxCocoa

open class RxCollectionViewCell<CellModel: RxCellModel>: UICollectionViewCell, CycleProtocol {
    public var disposeBag: DisposeBag = .init()
    public var viewModel: CellModel!

    public required init(viewModel: CellModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        initialize()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }

    open override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }

    open override func awakeFromNib() {
        super.awakeFromNib()
        layout()
    }

    open func layout() {}

    open func initialize() {}

    open func bind(_ viewModel: CellModel) {}
}
