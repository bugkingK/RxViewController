//
//  RxWindowController.swift
//  
//
//  Created by Kimun Kwon on 2021/06/23.
//

#if os(macOS)
import AppKit
import RxSwift

open class RxWindowController<ViewModel: RxViewModel>: NSWindowController, CycleProtocol {
    public var disposeBag: DisposeBag = .init()
    public var viewModel: ViewModel!

    public convenience required init(viewModel: ViewModel) {
        switch viewModel.kind.type {
        case .xib(let nibName):
            let nibName: String = nibName ?? ""
            self.init(windowNibName: nibName)
            self.viewModel = viewModel
        case .code:
            self.init()
            self.viewModel = viewModel
        default:
            fatalError("If an error occurs here, please register it as an issue.")
        }
    }
    
    public override init(window: NSWindow?) {
        super.init(window: window)
        self.initialize()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    open override func windowDidLoad() {
        super.windowDidLoad()
        layout()
        bind(viewModel)
    }

    deinit {
        Log.print(d: "DEINIT \(type(of: self))")
    }

    open func layout() {}

    open func initialize() {}

    open func bind(_ viewModel: ViewModel) {}
}

#endif
