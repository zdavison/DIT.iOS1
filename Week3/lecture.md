iOS 1.3
====================

Overview
--------------------

This class contains an overview of `UIViewController`, how it works with `UINavigationController`, and how `UIStoryboardSegue` allows for transitions between different screens.

[UIViewController](https://developer.apple.com/library/ios/Documentation/UIKit/Reference/UIViewController_Class/index.html)
--------------------

[**View Controller Programming Guide**](https://developer.apple.com/library/ios/featuredarticles/ViewControllerPGforiPhoneOS/Introduction/Introduction.html)

A `UIViewController` represents a grouping of various `UIView` instances, usually, it represents a **single screen** full of content, and although traditionally this was the de-facto  definition of a `UIViewController`, this has since been retracted and replaced with *an area of content*. This was mostly to allow for larger form factor devices, like the iPad, where this no longer held true.

For now however, let's consider a `UIViewController` as a single screen.

A `UIViewController` is responsible for managing a single view and all of its subviews, it is responsible for being presented, handling appearance/disappearance events, autorotation of the device (eg: from landscape to portrait), and more. It is the basis of almost all apps, and when you look at an initial project in XCode, it will most probably include a `UIViewController` subclass for you to start working with.

![](https://github.com/zdavison/DIT.iOS1/blob/master/Week3/viewcontroller.png)

Above, you can see a `UIViewController` from our Blackjack example, in Interface Builder. This is an instance of your `UIViewController` subclass, and when it is loaded, it will call your appropriate `viewDidLoad` method.

The arrow to the left of the `UIViewController` indicates that this is the **first** controller in the Storyboard, so we know where the entry point of our app is. This can be dragged and re-assigned as desired.

The core idea behind `UIViewController` is the ability to handle *screens*, and the ability to move between them, and this is handled by co-ordination with a `UINavigationController`.

[UINavigationController](https://developer.apple.com/library/ios/Documentation/UIKit/Reference/UINavigationController_Class/index.html)
--------------------

`UINavigationController` is responsible for managing a **stack** of view controllers. When we want to move forward a screen, we **push** a view controller onto the stack, and when we want to go back, we **pop** it from the stack.

![](https://github.com/zdavison/DIT.iOS1/blob/master/Week3/navigation.png)

In the above diagram, the *root view controller* is the initial screen we start on, when we tap `All Contacts`, we **push** the `list view controller` onto the stack. When we tap a cell, we **push** the `detail view controller` onto the stack.

If at any point we press the `back` arrow, we **pop** the currently visible view controller.

The navigation controller is responsible for this, and provides a set of methods which allow us to perform these operations:

```obj-c
- (UIViewController *)popViewControllerAnimated:(BOOL)animated;
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;
```

There are more, but for now, these are the only ones we need to understand. Calling these methods on a `UINavigationController` will allow us to present and dismiss screens as we so wish. Note the parameter of the `pushViewController:` method, which is the `UIViewController` we would like to **push**.

In Interface Builder, a UINavigationController with a `root view controller` set looks as follows:

![](https://github.com/zdavison/DIT.iOS1/blob/master/Week3/navigationcontroller.png)

[UIStoryboardSegue](https://developer.apple.com/library/ios/documentation/uikit/reference/UIStoryboardSegue_Class/index.html)
--------------------

UIStoryboardSegue is responsible for handling *transitions* between `UIViewController` instances. When you call `pushViewController:` on a `UINavigationController`, a **push segue** is created which will handle animation, and information passing for you.

A common requirement during a transition is passing information to the new `UIViewController` instance, if we look at our Contacts example above, we can see that the next screen in each case contains information that probably came from the previous screen, this is called **drilling down**.

Segues are a bridge between Interface Builder and code, and allow us to perform any required  preparations before a new `UIViewController` is presented on the screen.

![](https://github.com/zdavison/DIT.iOS1/blob/master/Week3/segue.png)

A segue can be created in Interface Builder by dragging from the `Triggered Segues` section in the dark IBOutlet menu (which can be summoned via right click), and dragging it onto the destination view controller. You can also drag events from buttons like `Touch Up Inside` onto the destination to create segues that are triggered via that event. (eg: when you press the button, the segue will occur).

You can then click the line created to assign an `identifier` to the segue, which will allow you to reference it later.

![](https://github.com/zdavison/DIT.iOS1/blob/master/Week3/identifier.png)

Whenever a segue is called (either via Interface Builder or manually using the `performSegue:` method), it will call `prepareForSegue:sender:`, which will pass the `UIStoryboardSegue` itself, along with whatever object initiated the segue (eg: the `sender`).

In here is where you can perform your preparations.

```obj-c
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton*)sender{
  if([segue.identifier isEqualToString:@"MyTransitionSegue"]){
    MySecondController *destinationViewController = segue.destinationViewController;
    destinationViewController.myString = sender.titleLabel.text;
  }
}
```

First, we check to see if the `identifier` of the segue (which we set earlier in Interface Builder) is the one we expect it to be, if so, we can continue.

Since we know the sender is a `UIButton`, we can substitute the type `id` for `UIButton`, so we can access the `titleLabel` property.

We are then just setting the text of a label on the `destinationViewController` to the text in our button.


Recap
--------------------

To recap, quickly, here is the lifecycle of moving from one screen to another in an iOS app.

A `UINavigationController` manages a stack of `UIViewController`s. It starts with a `root view controller`. When a button is pressed, or some other event that should trigger a transition, it creates a `UIStoryboardSegue` that handles the transition between the two `UIViewController`s. The `UIStoryboardSegue` calls the `prepareForSegue:sender:` method on the **first** `UIViewController`, in there, we can prepare as we wish, and when that method returns, the transition will execute and our **second* `UIViewController` will be pushed.
