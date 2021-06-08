//
//  Rx+UITableView.swift
//  RxViewControllerExample
//
//  Created by Bugking on 2021/05/31.
//

import Foundation
import RxSwift
import RxCocoa

extension ObservableType {
    /**
     Creates new subscription and sends elements to observer(s).
     In this form, it's equivalent to the `subscribe` method, but it better conveys intent, and enables
     writing more consistent binding code.
     - parameter to: Observers to receives events.
     - returns: Disposable object that can be used to unsubscribe the observers.
     */
    public func bind<Observer: ObserverType>(to observers: Observer?...) -> Disposable where Observer.Element == Element {
        self.subscribe { event in
            observers.forEach { $0?.on(event) }
        }
    }
}
