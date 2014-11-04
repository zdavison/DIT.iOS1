iOS1.4 Lab
====================

Overview
--------------------

The goal of this lab is to create an accurate reconstruction of the Twitter client screen we saw in the iOS1.4 lecture. It is not necessary to make anything function beyond what is visible on screen, all that is necessary is to replicate what you can see in this screenshot:

![](https://github.com/zdavison/DIT.iOS1/blob/master/Week4/twitter.png)

However, do not make a 'static' version of this, you must use a `UITableView` and `UITableViewCells` to represent tweets. For now, you do not need to worry about variable height tweets, simply make your tweet text body a maximum of 2 lines long, and all your cells the same height.

Exact replication is not necessary. Do not worry about exact icons (feel free to use defaults in XCode, or ASCII symbols), exact colors, or exact dimensions. All that is necessary is to create a rough replica of the screen.

Goals
--------------------
Your code should provide the following features:

- A replication of the above twitter screenshot.
- A `UITableView` that displays some tweets. You should create a `Tweet` class to hold tweets, and create some instances of them yourself as test data (it is not necessary to load tweets from the web). You can use a `UIImage` for the avatar, although a real world version would use a URL that you would then load the image from asynchronously.
- A `UITabBarController` with 4 buttons to access various screens, however, only the first needs to be functional.

Required Understanding
--------------------
UITableView, UITabBarController, UITableViewCell, how all these pieces fit together.

Hints
--------------------
- You will need to implement a `UITableViewDataSource` to provide cells for your `UITableView`.

Bonus
--------------------
There is a sample of real world Twitter JSON data [here](), can you load it using `AFNetworking` and display the tweets in your code?

Submission
--------------------
Please create a [GitHub](https://github.com/) account and `push` your code to a repository named `iOS1` under a folder called `Lab4`. Send me the URL for this repository. (email: `zac@getdrop.com`) Please include your real name with the URL if it is not already displayed on [GitHub](https://github.com/).


