# ConstraintsMonitor
A tool to understand constraints warnings, without any additional setup.

###
Before:
```
[LayoutConstraints] Unable to simultaneously satisfy constraints.
	Probably at least one of the constraints in the following list is one you don't want. 
	Try this: 
		(1) look at each constraint and try to figure out which you don't expect; 
		(2) find the code that added the unwanted constraint or constraints and fix it. 
	(Note: If you're seeing NSAutoresizingMaskLayoutConstraints that you don't understand, refer to the documentation for the UIView property translatesAutoresizingMaskIntoConstraints) 
(
    "<NSAutoresizingMaskLayoutConstraint:0x600003220d20 h=--& v=--& ConstraintsMonitor_Example.MyView:0x7fcdaff03e10.height == 896   (active)>",
    "<NSLayoutConstraint:0x600003220a50 UIView:0x7fcdaff031e0.height == 200   (active)>",
    "<NSLayoutConstraint:0x600003220410 V:|-(0)-[UIView:0x7fcdaff031e0]   (active, names: '|':ConstraintsMonitor_Example.MyView:0x7fcdaff03e10 )>",
    "<NSLayoutConstraint:0x600003220aa0 V:[UIView:0x7fcdaff031e0]-(0)-[UIView:0x7fcdaff03fc0]   (active)>",
    "<NSLayoutConstraint:0x600003220b90 UIView:0x7fcdaff03fc0.bottom == ConstraintsMonitor_Example.MyView:0x7fcdaff03e10.bottom   (active)>",
    "<NSLayoutConstraint:0x600003220be0 UIView:0x7fcdaff03fc0.height == 0.2*ConstraintsMonitor_Example.MyView:0x7fcdaff03e10.height   (active)>"
)

Will attempt to recover by breaking constraint 
<NSLayoutConstraint:0x600003220a50 UIView:0x7fcdaff031e0.height == 200   (active)>
```

With **ConstraintsMonitor**:
```
[LayoutConstraints] Unable to simultaneously satisfy constraints.
	Probably at least one of the constraints in the following list is one you don't want. 
	Try this: 
		(1) look at each constraint and try to figure out which you don't expect; 
		(2) find the code that added the unwanted constraint or constraints and fix it. 
	(Note: If you're seeing NSAutoresizingMaskLayoutConstraints that you don't understand, refer to the documentation for the UIView property translatesAutoresizingMaskIntoConstraints) 
(
    "UIViewControllerWrapperView.MyView.height == 896.0 (Did you set translatesAutoresizingMaskIntoConstraints = false?)",
    "MyView.UIView.height == 200.0 ",
    "MyView.UIView.top == UIViewControllerWrapperView.MyView.top (constant: 0.0)",
    "MyView.UIView.top == UIView.bottom (constant: 0.0)",
    "MyView.UIView.bottom == UIViewControllerWrapperView.MyView.bottom (constant: 0.0)",
    "MyView.UIView.height == UIViewControllerWrapperView.MyView.height (multiplier: 0.200)"
)

Will attempt to recover by breaking constraint 
MyView.UIView.height == 200.0 

Make a symbolic breakpoint at UIViewAlertForUnsatisfiableConstraints to catch this in the debugger.
The methods in the UIConstraintBasedLayoutDebugging category on UIView listed in <UIKitCore/UIView.h> may also be helpful.
```



## Installation
ConstraintsMonitor is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ConstraintsMonitor'
```

## Usage
Just by having this lib, you will see nicer constraints warnings

## Key Features
* Use an identifier for the constraint if supplied.
* Use the view identifier or the class name if the view is a subclass of UIView.
* Show the parent view, so it's easier to know where to locate the issue.

## How does it work?
By overriding the description property of the `NSLayoutConstraint` involved, we have a nicer way of viewing constraints.

## Author
You can check my blog at https://deep-thought.netlify.com/ or @FranDepascuali in twitter.

## License
ConstraintsMonitor is available under the MIT license. See the LICENSE file for more info.
