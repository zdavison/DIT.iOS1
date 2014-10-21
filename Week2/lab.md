iOS1.2 Lab
====================

Overview
--------------------

The goal of this lab is to extend the code in the [OOP1.2]() lab with UI to let the player play the game of Blackjack.

Please refer to the [OOP1.2]() lab if you are missing things you may need for this lab.

Goals
--------------------
Your code should provide the following features:

- A button that the user can press to draw a card and check the state of the game. (eg: When you draw a card, check the state of the game and update the UI accordingly).
- A label that displays your current hand.
- A label that tells you if you have gone bust or won the game.
- A label that displays your current hand value.

![](https://github.com/zdavison/DIT.iOS1/blob/master/Week2/blackjack_ui.png)

Required Understanding
--------------------
Interface Builder, UILabel, UIButton, IBAction, IBOutlet.

Hints
--------------------
- Your button events will give you a good place to 'advance' the game a turn.
- Our game of Blackjack does not have a dealer, we are playing alone. All your game needs to do is let you draw cards until you either hit 5 cards, hit 21, or lose.
- Our game of Blackjack is considered instantly lost if your hand goes over 21.
- If you have problems laying out your UI (eg: your UI doesnt appear how you expect when you run) in Interface Builder, try unchecking `Use Autolayout` in the first menu on the right side pane in XCode:

Bonus
--------------------
Provide a way to restart the game once you have won or gone bust.

Submission
--------------------
Please create a [GitHub](https://github.com/) account and `push` your code to a repository named `iOS1` under a folder called `Lab2`. Send me the URL for this repository. Please include your real name with the URL if it is not already displayed on [GitHub](https://github.com/).


