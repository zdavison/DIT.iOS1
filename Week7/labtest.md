Rules
---------------

This lab test is designed to show your understanding of the course so far, but primarily is focused around you understanding your way around creating a basic core app that implements a UITableView, network requests, segues, etc.


**> NOTE <**

Unlike the OOP1 test, consulting online resources apart from the lecture notes and the Apple documentation is forbidden. You may also use any of your own notes.

- https://developer.apple.com/library/mac/navigation/index.html#section=Resource%20Types&topic=Reference
- https://github.com/zdavison/DIT.iOS1
- https://github.com/zdavison/DIT.OOP1

No usage of messenger programs like GChat, Facebook Chat, AIM, MSN, etc is permitted, any breach of either of these will result in a mark of 0.

Requirements
---------------

You are required to create an app that fulfills the following requirements:

- A `UITabBarController` with 2 tabs to display 2 different **view controllers**, these having:
  - A `UITableView`, along with a data source to display some data.
  - A `UIViewController` containing a button that when pressed, performs a `push segue` to another `UIViewController`. Hint: You will need to use a `UINavigationController`.

- The first view controller with the tableview should load the `json` file from the following URL:
https://raw.githubusercontent.com/zdavison/DIT.iOS1/master/Week4/sample.json

- It should then display this data in the UITableView, inside UITableViewCells. Each cell should contain the following (all of which is contained within the `json` data which you will need to consult, you are free to format/display it as you wish, style is not important).
  - Name of the user who posted the tweet.
  - Date the tweet was posted.
  - Text of the tweet.
  - A list of any hashtags mentioned in the tweet.

Marking
---------------
- The UITableView, including loading data from the web, is worth 60%.
- The UIViewController / segue section is worth 30%.
- The remaining 10% is distributed for clean code and organisation.

Instructions
---------------

Create your project in XCode. The `AFNetworking` library is provided [here in a zip file](https://github.com/zdavison/DIT.OOP1/blob/master/Week4/AFNetworking.zip?raw=true) for you to use. Remember to copy the files to the project when you add them.

You must submit your solution to a GitHub repository and email me the link to `zac@getdrop.com`. If you cannot do this, you may email your solution to me in a zip file, but a penalty of **10%** will be deducted from your mark.






