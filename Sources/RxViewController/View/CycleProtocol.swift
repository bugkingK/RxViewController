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
    static func instantiate(viewModel: ViewModel) -> Self {
        guard let viewModel = viewModel as? RxViewModel else {
            fatalError("Please check the init value of ViewModel again.")
        }

        switch viewModel.kind.type {
        case .storyboard(let storyboardID, let identifier):
            let identifier: String = identifier ?? .init(describing: self)
            let storyboard = UIStoryboard(name: storyboardID, bundle: viewModel.kind.bundle)

            guard var viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? Self else {
                fatalError("Please check the init value of ViewModel again.")
            }

            if let viewModel = viewModel as? Self.ViewModel {
                viewController.viewModel = viewModel
            } else {
                Log.warning(d: "\(identifier)) Failed to initialize ViewModel.")
            }

            return viewController
        case .nib(let nibName):
            let nibName: String = nibName ?? .init(describing: self)
            let nib = UINib(nibName: nibName, bundle: viewModel.kind.bundle)
            if let viewController = nib.instantiate(withOwner: nil, options: nil) {
//                if let viewModel = viewModel as? Self.ViewModel {
//                    viewController.bind(viewModel)
//                } else {
//                    Log.warning(d: "\(nibName)) Failed to initialize ViewModel.")
//                }
                fatalError("Please check the init value of ViewModel again.")
//                return viewController
            } else {
                fatalError("Please check the init value of ViewModel again.")
            }
        }
    }
}
