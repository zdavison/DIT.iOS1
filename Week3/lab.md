OOP1.3 Lab
====================

Overview
--------------------

The goal of this lab is to create a `UIViewController` that can transition to another screen whenever either of two buttons is pressed, and print the text of the button that was pressed on the second screen.

![](https://github.com/zdavison/DIT.iOS1/blob/master/Week3/lab.png)

Goals
--------------------
Your code should provide the following features:

- One `UINavigationController` with a `root view controller`.
- One `UIViewController` with two buttons.
- One `UIViewController with a label.
- You should `segue` between the `UIViewController` with buttons to the `UIViewController` with a label whenever either of the buttons are pressed.
- When you transition to the `UIViewController`, your label should contain the text of the button that was pressed to get there.

Required Understanding
--------------------
UINavigationController, UIViewController, UIStoryboardSegue

Hints
--------------------

Bonus
--------------------
- Rather than use two buttons, use a `UITableView`, and whenever a cell is selected, it should transition to the second screen and print the contents of the cell. You will need to read the `UITableViewDelegate` documentation to find out how to handle cell selection events.

Submission
--------------------
Please create a [GitHub](https://github.com/) account and `push` your code to a repository named `OOP1` under a folder called `Lab3`. Send me the URL for this repository. (email: `zac@getdrop.com`) Please include your real name with the URL if it is not already displayed on [GitHub](https://github.com/).


