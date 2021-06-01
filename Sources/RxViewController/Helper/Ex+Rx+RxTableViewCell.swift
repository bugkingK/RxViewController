//
//  File.swift
//  
//
//  Created by Bugking on 2021/05/31.
//

import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UITableViewCell {
    var setSelected: ControlEvent<Bool> {
        return .init(events: methodInvoked(#selector(base.setSelected(_:animated:))).compactMap { $0[0] as? Bool })
    }

    var prepareForReuse: ControlEvent<Void> {
        return .init(events: methodInvoked(#selector(base.prepareForReuse)).map { _ in })
    }
}

extension Reactive where Base: UICollectionViewCell {
    var setSelected: ControlEvent<Bool> {
        return .init(events: methodInvoked(#selector(getter: base.isSelected)).compactMap { $0[0] as? Bool })
    }

    var prepareForReuse: ControlEvent<Void> {
        return .init(events: methodInvoked(#selector(base.prepareForReuse)).map { _ in })
    }
}
