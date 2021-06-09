//
//  RxTabBarController.swift
//
//
//  Created by Kimun Kwon on 2021/02/20.
//

import UIKit
import RxSwift

open class RxTabBarController<ViewModel: RxViewModel>: UITabBarController, CycleProtocol {
    public var disposeBag: DisposeBag = .init()
    public var viewModel: ViewModel!

    public required init(viewModel: ViewModel) {
        self.viewModel = viewModel
        switch viewModel.kind.type {
        case .xib(let nibName):
            // not support
            super.init(nibName: nibName, bundle: viewModel.kind.bundle)
        default:
            super.init(nibName: nil, bundle: viewModel.kind.bundle)
        }
    }

    public override required init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        initialize()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        bind(viewModel)
    }

    deinit {
        Log.print(d: "DEINIT \(type(of: self))")
    }

    open func layout() {}

    open func initialize() {}

    open func bind(_ viewModel: ViewModel) {}
}
