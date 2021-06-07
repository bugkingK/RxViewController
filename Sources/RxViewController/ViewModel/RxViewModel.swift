//
//  RxViewModel.swift
//  
//
//  Created by Kimun Kwon on 2021/02/20.
//

import Foundation
import RxSwift

public protocol ViewModelProtocol {
    associatedtype Input
    associatedtype Output

    var input: Input { get }

    func transform() -> Output
}


struct RxViewModelKind {
    enum ViewType {
        case storyboard(_ storyboardID: String, _ identifier: String?)
        case xib(_ nibName: String?)
    }

    let type: ViewType
    let bundle: Bundle?
}

open class RxViewModel: NSObject {
    public var disposeBag: DisposeBag = .init()
    let kind: RxViewModelKind

    /// Used to initialize to the Code
    public override init() {
        self.kind = .init(type: .xib(nil), bundle: nil)
        super.init()
    }

    /**
     Used to initialize to the storyboard.

     - Parameters:
        - storyboardID: The name of the storyboard resource file without the filename extension. This method raises an exception if this parameter is nil.
        - identifier: An identifier string that uniquely identifies the view controller in the storyboard file.
        - bundle: A representation of the code and resources stored in a bundle directory on disk.
     */
    public init(storyboardID: String,
                identifier: String? = nil,
                bundle: Bundle = .main) {
        kind = .init(type: .storyboard(storyboardID, identifier), bundle: bundle)
        super.init()
    }

    /**
     Used to initialize with UINib.

     - Parameters:
        - nibName: Returns a UINib object initialized to the nib file in the specified bundle.
        - bundle: A representation of the code and resources stored in a bundle directory on disk.
     */
    public init(nibName: String?,
                bundle: Bundle = .main) {
        kind = .init(type: .xib(nibName), bundle: bundle)
        super.init()
    }

    deinit {
        Log.print(d: "DEINIT \(type(of: self))")
    }
}
