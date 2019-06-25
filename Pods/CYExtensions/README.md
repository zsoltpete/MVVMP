![alt text](https://bitbucket.org/team-codeyard/cyextensions/raw/6c854549530fbdb1992868d25bc6e39196e46c36/cyextensions.png)

# CYExtensions
![Platform](http://img.shields.io/badge/platform-ios-blue.svg?style=flat)
![Cocoapods](https://img.shields.io/badge/Cocoapods-compatible-brightgreen.svg)
![Swift Version](https://img.shields.io/badge/Swift-4.1-brightgreen.svg)
![License](http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat
)
![pod](https://img.shields.io/badge/pod-v1.4.0-red.svg)

Extensions for better development. Use components better, faster coding in Swift. 

How to update new version.
- Add new files to Source folder
- Check all variables and method (You should add 'Public' access level to variables and methods, but in Protocols you shouldn't add only next to protocol name)
- Then update version number in pod scep
- Commit all changes
- Add a tag with the new version number
- Push it to the remote `git push origin master --tags`
- Then check validity `pod spec lint`
- If you got some error solve it and start from first step
- If valid then `pod repo pusg [PODNAME] [PODSPEC]`
- After that Pull podyard repo
- Open CYExtension folder
- Copy last folder and change name to new version of CYExtensions
- Open that folder and change version number
- After that you should push that changes after commit it
- Finished! You just execute `pod update CYExtensions` in one of your project folder

## Components
1. Array
2. Bundle
3. CALayer
4. Date
5. String
6. UIColor
7. UIImage
8. UISearchBar
9. UITextField
10. UIView
11. UIViewController

## _1. Array:_
```
["Foo", "Bar", "Junkie", "Let"].sample()
```
Results is `Foo`

## _2. Bundle:_
```
Bundle.main.releaseVersionNumber
```
Show the app release version.
```
Bundle.main.buildVersionNumber
```
Show the app build version.

## _10. UIView:_
```
let screenshot = self.view.takeScreenshot()
self.imageView.image = screenshot
```
Result: In this image view contain an image of this view.

## _11. UIViewController:_
```
class ViewController {
  
  override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
}
```
Result:  When the keyboard is up and tap above it, the keyboard will be  dismissed.