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

    public convenience required init(viewModel: ViewModel) {
        switch viewModel.kind.type {
        case .xib(let nibName):
            self.init(nibName: nibName, bundle: viewModel.kind.bundle)
            self.viewModel = viewModel
            let nibName: String = nibName ?? .init(describing: self)

            if let view = viewModel.kind.bundle?.loadNibNamed(nibName, owner: self, options: nil)?.first as? UIView {
                self.view = view
                self.viewDidLoad()
            } else {
                Log.print(d: "\(nibName)) Failed to initialize UIView")
            }
        case .code:
            self.init()
            self.viewModel = viewModel
        default:
            fatalError("If an error occurs here, please register it as an issue.")
        }
    }

    public override required init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.initialize()
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
