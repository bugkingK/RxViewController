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

    /**
     Used to initialize the RxViewController.

     - Parameters:
        - storyboardID: The name of the storyboard resource file without the filename extension. This method raises an exception if this parameter is nil.
        - identifier: An identifier string that uniquely identifies the view controller in the storyboard file.
        - bundle: A representation of the code and resources stored in a bundle directory on disk.
     */
    public init(storyboardID: String,
                identifier: String? = nil,
                bundle: Bundle = .main) {
        self.storyboardID = storyboardID
        self.identifier = identifier
        self.bundle = bundle
        super.init()
    }

    /**
     Used to initialize the RxView

     - Parameters:
        - nibName: Returns a UINib object initialized to the nib file in the specified bundle.
        - bundle: A representation of the code and resources stored in a bundle directory on disk.
     */
    public init(nibName: String? = nil,
                bundle: Bundle = .main) {
        self.storyboardID = ""
        self.identifier = nibName
        self.bundle = bundle
    }

    deinit {
        Log.print(d: "DEINIT \(type(of: self))")
    }
}
