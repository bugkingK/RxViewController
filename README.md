# RxViewController

![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg)

RxViewController is a library for the development with MVVM-C based on RxSwift.

- RxSwift (https://github.com/ReactiveX/RxSwift)
- RxCocoa (https://github.com/ReactiveX/RxSwift)

RxController provides the the following basic view controller and view model classes.

- RxViewController
- RxViewModel

## Installation
<b>Manual:</b>
<pre>
Copy <i>RxViewController</i> folder to your project.
</pre>

<b>Swift Package Manager:</b>

You can use [The Swift Package Manager](https://swift.org/package-manager) to install `RxViewController` by adding the proper description to your `Package.swift` file:

```swift

let package = Package(
    name: "YOUR_PROJECT_NAME",
    dependencies: [
        .package(url: "https://github.com/bugkingK/RxViewController.git", from: "1.0.0"),
    ]
)
```
Then run `swift build` whenever you get prepared.

### Generic class of View Controller

RxController provides a generic classes `RxViewController`.
It avoids using an `Optional` or an `Implicit Unwrapping Option` type for the view model property in the view controller class.

In the demo app, we define the view model class by extending the RxViewModel class, and the view controller class by extending the RxViewController generic class.

```Swift
// View model class
final class HomeViewModel: RxViewModel {

}

// View controller class
fianl class HomeViewController: RxViewController<HomeViewModel> {

}
```

### RxViewController LifeCycle
Defines the various layout properties of the 'UIViewController'.

- `open func layout()`

Used when a change to the Cocoa dependency properties that should be injected at 'init()' time is required.
⚠️ Caution: Changing properties other than the init point in time may affect the viewDidLoad point in time

- `open func initialize()`

Binding properties of 'RxViewModel' and each component, In 'bind', it is possible to perform both the definition behavior and the change in location of variable properties.

- `func bind(_ viewModel: ViewModel)`

Used to initialize with code without storyboard and inject ViewModel.
- `init(viewModel: ViewModel)`

Used to initialize with storyboard and inject ViewModel. To use this method, override the init of ViewModel.
- `static func initWith(viewModel: RxViewModel) -> Self`

### RxViewModel Init with Storyboard
Used to initialize to the storyboard.
-`public init(storyboardID: String, identifier: String, bundle: Bundle)`

Used to initialize with UINib.
-`public init(nibName: String?, bundle: Bundle`

When initializing using the storyboard, either of the above methods must be overridden before the `public init(storyboardID: String, identifier: String, bundle: Bundle)` method can be executed.


### Author

bugkingK, myway0710@naver.com

### License

RxViewController is available under the MIT license. See the LICENSE file for more info.
