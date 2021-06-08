//
//  RxViewController.swift
//
//
//  Created by Kimun Kwon on 2021/02/20.
//

import UIKit
import RxSwift

open class RxViewController<ViewModel: RxViewModel>: UIViewController, CycleProtocol {
    public var disposeBag: DisposeBag = .init()
    public var viewModel: ViewModel!

    public required init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: viewModel.kind.bundle)
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
