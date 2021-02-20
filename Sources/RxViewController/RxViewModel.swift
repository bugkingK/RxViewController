//
//  RxViewModel.swift
//  
//
//  Created by Kimun Kwon on 2021/02/20.
//

import Foundation
import RxSwift

public protocol ViewBindable {
    associatedtype Input
    associatedtype Output

    var input: Input { get }

    func transform() -> Output
}

open class RxViewModel: NSObject {
    public var disposeBag: DisposeBag = .init()
    var storyboardID: String
    var identifier: String?
    var bundle: Bundle

    public init(storyboardID: String,
                identifier: String? = nil,
                bundle: Bundle = .main) {
        self.storyboardID = storyboardID
        self.identifier = identifier
        self.bundle = bundle
        super.init()
    }

    deinit {
        Log.print(d: "DEINIT \(type(of: self))")
    }
}
