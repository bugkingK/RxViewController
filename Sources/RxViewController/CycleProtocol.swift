//
//  CycleProtocol.swift
//  
//
//  Created by Kimun Kwon on 2021/02/20.
//

import UIKit
import RxSwift

public protocol CycleProtocol {
    associatedtype ViewModel
    var disposeBag: DisposeBag { get }
    var viewModel: ViewModel! { get set }

    /**
     Defines the various layout properties of the 'UIViewController'.
     */
    func layout()

    /**
     Used when a change to the Cocoa dependency properties that should be injected at 'init()' time is required.
     ⚠️ Caution: Changing properties other than the init point in time may affect the viewDidLoad point in time
     */
    func initialize()

    /**
     Defines the various layout properties of the 'UIViewController'.

     - Binding properties of 'RxViewModel' and each component
     - In 'bind', it is possible to perform both the definition behavior and the change in location of variable properties.

     *(Define only behavior that changes with any Observable, not directly inputting behavior.)*

     - Parameters:
     - viewModel: This is 'RxViewModel' that can bind to the view.
     */
    func bind(_ viewModel: ViewModel)

    init(viewModel: ViewModel)
}

public extension CycleProtocol {
    static func initWith(viewModel: RxViewModel) -> Self {
        switch viewModel.kind.type {
        case .controller:
            let identifier: String = viewModel.kind.identifier ?? .init(describing: self)
            let storyboard = UIStoryboard(name: viewModel.kind.storyboardID, bundle: viewModel.kind.bundle)

            guard var viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? Self else {
                fatalError("Please check the init value of ViewModel again.")
            }

            if let viewModel = viewModel as? Self.ViewModel {
                viewController.viewModel = viewModel
            }

            return viewController
        case .view:
            let nibName: String = viewModel.kind.identifier ?? .init(describing: self)
            let nib: UINib = .init(nibName: nibName, bundle: viewModel.kind.bundle)
            
            if let view = nib.instantiate(withOwner: nil, options: nil)[0] as? Self {
                if let viewModel = viewModel as? Self.ViewModel {
                    view.bind(viewModel)
                }

                return view
            } else {
                fatalError("Please check the init value of ViewModel again.")
            }
        }
    }
}
