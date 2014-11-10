iOS 1.4
====================

Overview
--------------------

This class begins to analyse how we could build a real world application, a Twitter client, giving an overview of every component used to build the screen.

![](https://github.com/zdavison/DIT.iOS1/blob/master/Week4/twitter.PNG)

[UINavigationBar](https://developer.apple.com/Library/ios/documentation/UIKit/Reference/UINavigationBar_Class/index.html)
--------------------

![](https://github.com/zdavison/DIT.iOS1/blob/master/Week4/navigationbar.png)

The `UINavigationBar` represents the bar at the top of the screen. Usually, we use a `UINavigationController`, which gives us a `UINavigationBar` for free, but the Twitter app uses a `UITabBar` for navigation, and tweets are **modally** presented, so it appears that we most probably do not use a `UINavigationController`.

However, we'd still like the bar, so we use a `UINavigationBar`.

A `UINavigationBar` contains a `Navigation Item`, and multiple instances of `UIBarButtonItem` for the left and right buttons, respectively.

Also, in our bar, we can see a set of dots representing which screen we are on, which is an instance of `UIPageControl`.

[UITableView](https://developer.apple.com/Library/ios/documentation/UIKit/Reference/UITableView_Class/index.html)
--------------------

![](https://github.com/zdavison/DIT.iOS1/blob/master/Week4/tableview.png)

The `UITableView`, our old friend, is responsible for displaying our scrolling view full of cells. There's nothing special about this one, all the interesting stuff is in the cells.

Our `UIViewController` that is the `delegate` and `datasource` of our `UITableView` does however implement some interesting methods to allow our cells to be **dynamically sized**, namely `tableView:heightForRowAtIndexPath:`, which is called by the tableview to ask for the height of a specific cell, we return a `CGFloat` from here representing the height of the cell.

[UITableViewCell](https://developer.apple.com/Library/ios/documentation/UIKit/Reference/UITableViewCell_Class/index.html)
--------------------

![](https://github.com/zdavison/DIT.iOS1/blob/master/Week4/cell.png)

The `UITableViewCell` contains the majority of the interesting stuff here, we have looked at it before, but to review, it contains, from top-left to bottom-right:

- A `UIImageView` containing the users profile picture. This has rounded corners applied. You can do this with `myView.layer.cornerRadius = 4`, but this performs badly on scroll, and in practice what has been done here is the image has been **masked** once it was downloaded from the web.
- A `UILabel` to hold the users real name: (**paradise_garage_bot**).
- A `UILabel` to hold the users username (truncated in this case): (**@garage...**)
- A `UILabel` to hold the time.
- A `UITextView` to hold the tweet itself. Why do we not use a `UILabel`? We can see that links are clickable in these tweets, and this behaviour is provided by `UITextView`.
- 3 `UIButtons` to handle *reply*, *retweet* and *favorite*.

Some of the cells have another `UIImageView` to show images that are linked in the tweet, but let's ignore those for now.

If we were to define these cells in Interface Builder, we would use a `Prototype Cell`. Please refer to [this tutorial](http://code.tutsplus.com/tutorials/ios-sdk-crafting-custom-uitableview-cells--mobile-15702) for a guide to prototype cells in Interface Builder.

[UITabBarController](https://developer.apple.com/Library/ios/documentation/UIKit/Reference/UITabBarController_Class/index.html)
--------------------

![](https://github.com/zdavison/DIT.iOS1/blob/master/Week4/tabbar.png)

It's possible that Twitter are using a raw `UITabBar`, rather than a `UITabBarController`, but for our purposes let's assume they are using the controller variant, which, like a `UINavigationController`, manages navigation between tabs for us.

It is important to note that this `UITabBarController` contains the `UIViewController` that we talked about above, containing the table of tweets, along with another 3 `UIViewControllers`, so this `UITabBarController` is **not** inside this `UIViewController`.

The `UITabBar` itself, contained within the `UITabBarController` is very easy to customize via Interface Builder, and simply contains icons and strings for each tab.

Networking / Data Flow
--------------------

Networking is most probably performed by `AFNetworking` or a bespoke Twitter networking library, the request structure most probably looks like this (the endpoint names are rough guesses, we could find out for sure by checking the [API documentation](https://dev.twitter.com/overview/documentation)).

- `http://twitter.com/auth` -> We hit this endpoint to authenticate our user and acquire an **access token**, which is a string representing a temporary key that allows us to make requests on behalf of that user (we are the app).
- `http://twitter.com/<username>/tweets` -> We hit this endpoint to retrieve a list of tweets. The arguments we pass to this will probably allow us to paginate tweets and more, but for now let us assume a simple endpoint that just gives us the latest 50 tweets.

Once we have these tweets, we will parse them from **JSON** into real objects. This process of transforming **JSON** responses from an `NSDictionary` representation into useful typed objects is known as **marshalling**. There are many strategies to perform this, but the simplest may look like this (all keys are not exact).

```obj-c
void (^completionBlock)(AFHTTPRequestOperation *operation, id responseObject){
 NSDictionary *jsonDictionary = (NSDictionary*)responseObject;
 Tweet *tweet     = [][Tweet alloc] init];
 tweet.name       = jsonDictionary[@"name"];
 tweet.username   = jsonDictionary[@"username"];
 tweet.text       = jsonDictionary[@"tweet"];
 tweet.avatarURL  = jsonDictionary[@"avatar"];
 tweet.time       = jsonDictionary[@"time"];

 [_tweets addObject:tweet];
}
```

There are more advanced ways to perform marshalling, but they are just neater ways of performing the same thing.

Once we have these tweets, our `UITableView` can `reloadData` and display a cell for each tweet in `tableView:cellForRowAtIndexPath:`.
