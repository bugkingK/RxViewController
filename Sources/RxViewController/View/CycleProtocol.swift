//
//  CycleProtocol.swift
//  
//
//  Created by Kimun Kwon on 2021/02/20.
//

#if os(iOS) || os(tvOS)
    import UIKit
#elseif os(macOS)
    import AppKit
#endif

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
     ViewModel is not accessible in the current state.
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
            fatalError("If an error occurs here, please register it as an issue.")
        }

        switch viewModel.kind.type {
        case .storyboard(let storyboardID, let identifier):
            let identifier: String = identifier ?? .init(describing: self)
            var viewController: Self
            
            #if os(iOS) || os(tvOS)
            let storyboard = UIStoryboard(name: storyboardID, bundle: viewModel.kind.bundle)
            guard let vc = storyboard.instantiateViewController(withIdentifier: identifier) as? Self else {
                fatalError("Please check the init value of ViewModel again.")
            }
            viewController = vc
            
            #elseif os(macOS)
            let storyboard = NSStoryboard(name: storyboardID, bundle: viewModel.kind.bundle)
            guard let vc = storyboard.instantiateController(withIdentifier: identifier) as? Self else {
                fatalError("Please check the init value of ViewModel again.")
            }
            viewController = vc
            #endif
            
            if let viewModel = viewModel as? Self.ViewModel {
                viewController.viewModel = viewModel
            } else {
                Log.print(d: "\(identifier)) Failed to initialize ViewModel.")
            }

            return viewController
        case .xib, .code:
            if let viewModel = viewModel as? Self.ViewModel {
                return self.init(viewModel: viewModel)
            } else {
                fatalError("If an error occurs here, please register it as an issue.")
            }
        }
    }
}
