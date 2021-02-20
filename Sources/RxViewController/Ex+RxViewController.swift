//
//  Ex+RxViewController.swift
//  
//
//  Created by Kimun Kwon on 2021/02/20.
//

import UIKit

public extension RxViewController {
    
    static func initWith(viewModel: ViewModel) -> Self {
        let identifier: String = viewModel.identifier ?? .init(describing: self)
        let storyboard = UIStoryboard(name: viewModel.storyboardID, bundle: viewModel.bundle)

        guard let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? Self else {
            fatalError("Please check the init value of ViewModel again.")
        }
        viewController.viewModel = viewModel
        return viewController
    }
}
