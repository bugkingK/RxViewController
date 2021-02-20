//
//  Ex+RxView.swift
//  
//
//  Created by Kimun Kwon on 2021/02/20.
//

import UIKit

public extension RxView {

    static func initWith(viewModel: ViewModel) -> Self {
        let nibName: String = viewModel.identifier ?? .init(describing: self)
        if let view = UINib(nibName: nibName, bundle: viewModel.bundle).instantiate(withOwner: nil, options: nil)[0] as? Self {
            view.bind(viewModel)
            return view
        } else {
            fatalError("Please check the init value of ViewModel again.")
        }
    }
}
