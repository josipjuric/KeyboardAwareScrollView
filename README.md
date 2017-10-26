# KeyboardAwareScrollView
Swift protocol extension for automatically adjusting ScrollView offset when keyboard appears/dissapears with only 2 lines of code required for setup propperly.

There is no any pod installation required!

####To use it:
1. Drag KeyboardAwareScrollView file to you XCode project
2. In you ViewController add conformance to the KeyboardAwareScrollView protocol
3. Drag outlet for your UIScrollView in your ViewController and name it "scrollView"
4. In your ViewDidLoad method add "self.setupKeyboardListener()"


#### Example usage:
```swift
class HomeViewController: UIViewController, KeyboardAwareViewController  {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupKeyboardListener()
    }
}
```
