//
//  RxTabBarController.swift
//  
//
//  Created by Kimun Kwon on 2021/02/20.
//

import UIKit
import RxSwift

open class RxTabBarController<ViewModel: RxViewModel>: UITabBarController {
    public var disposeBag: DisposeBag = .init()
    public var viewModel: ViewModel!

    public init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: viewModel.identifier, bundle: viewModel.bundle)
        initialize()
        bind(viewModel)
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }

    deinit {
        Log.print(d: "DEINIT \(type(of: self))")
    }

    /**
     Defines the various layout properties of the 'UITabBarController'.
     */
    open func layout() {}

    /**
     Used when a change to the Cocoa dependency properties that should be injected at 'init()' time is required.
     ⚠️ Caution: Changing properties other than the init point in time may affect the viewDidLoad point in time
     */
    open func initialize() {}

    /**
     Defines the various layout properties of the 'UITabBarController'.

     - Binding properties of 'RxViewModel' and each component
     - In 'bind', it is possible to perform both the definition behavior and the change in location of variable properties.

     *(Define only behavior that changes with any Observable, not directly inputting behavior.)*

     - Parameters:
        - viewModel: This is 'RxViewModel' that can bind to the view.
     */
    open func bind(_ viewModel: ViewModel) {}
}
