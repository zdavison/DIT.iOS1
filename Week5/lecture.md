iOS 1.5
====================

Overview
--------------------

This class reviews the features of Interface Builder, where things are located, and how to use it's major features.

![](https://github.com/zdavison/DIT.iOS1/blob/master/Week5/interfacebuilder.png)

Properties Pane
--------------------

![](https://github.com/zdavison/DIT.iOS1/blob/master/Week5/properties.png)

The properties pane shows information about whatever you have currently selected. It has 6 tabs, indicated by the icons at the top, they are, left to right:

- File details pane: This contains information about the current whole file, eg: the .storyboard or .xib you are working on. Useful things in here are the enable/disable Autolayout options, and Localization settings.
- Quick Help pane. Gives you short documentation snippets / help.
- Class / Attributes pane: In here you can set your **class**, storyboard IDs, and User Defined Runtime Attributes.
- Properties: This contains all of the properties of the object you are currently inspecting, most of the things you need are in here, fonts, colors, etc. These properties all map to `@property` declarations on the class you are looking at, so you can consult the documentation to see what they all do.
- Frames pane: This contains all information about sizes and frames, eg: (x,y) coordinates and widths/heights.
- IBOutlet pane: This has the same information as when you right click on a view.

Object Browser
--------------------

![](https://github.com/zdavison/DIT.iOS1/blob/master/Week5/objectbrowser.png)

The object browser has every type of object you can drag into your canvas. If you're looking for views, view controllers, etc, they're all in here. There is also a search box so you can quickly search for what you need.

There are 4 panes, but only the last two are particularly useful, the 3rd is selected by default, and contains all the view related stuff, and the 4th contains any images you've added to your project.

Canvas
--------------------

![](https://github.com/zdavison/DIT.iOS1/blob/master/Week5/canvas.png)

The canvas contains everything, your view controllers, your views, your segues. The button in the bottom left opens the `Dock`, if you close it by accident, and the other buttons are all shortcuts for `Auto Layout` functions.

Dock
--------------------

![](https://github.com/zdavison/DIT.iOS1/blob/master/Week5/dock.png)

The dock contains a list of your views / view controllers, and their tree of child views. You can see the order of your views (bottom of the list is on 'top'), and which views are contained within which other views.

IBOutlet Pane
--------------------

![](https://github.com/zdavison/DIT.iOS1/blob/master/Week5/dock.png)

The IBOutlet pane is where you connect various `IBAction`s and `IBOutlet`s belonging to the view you summoned it from. You make it appear by right clicking on any view or view controller (in the canvas or dock). You can then connect up `IBOutlet`s or `IBActions` by dragging the little `+` to whatever it is you'd like to connect it to.


IBOutlets
--------------------

An `IBOutlet` is simply a connection between Interface Builder and your code. It must be the same class on both ends of the connection, eg: in Interface Builder (You can change this in the **Properties Pane**), and within your `@property` declaration.

IBAction
--------------------
`IBAction`s are the same, but reference events, rather than views or objects. They are used for things like button events, sliders changing, etc.

Storyboards and .xibs
--------------------
There are two types of Interface Builder file. Storyboards and .xibs. Storyboards usually refer to one or more ViewControllers, while .xibs are used for single views (eg: UITableViewCells). Other than this, there are very few differences within Interface Builder.

Tips
--------------------
- If something is stuck beneath another view, and you can't select it via the canvas (usually because you want to move it with arrow keys), you can use `ctrl+shift+option` to show a menu showing everything under where you clicked.
- If your IBOutlets dont appear, make sure you have set the class of the view you are dealing with to the correct class.
- You don't need to define `IBAction`s in your header file. This can be nice sometimes to keep your header files clean and implementation abstracted.
- You can define segues either manually or within Interface Builder. Within Interface Builder, you can tie a segue to a button event, in the same way you would tie a button event to an `IBAction`, this will trigger the segue, without any code needed from your end.

Prototype Cells
--------------------

![](https://github.com/zdavison/DIT.iOS1/blob/master/Week5/prototype.png)

Prototype Cells are a way we can create an example `UITableViewCell` instance inside our UITableView, so we can wire it up and work with it. We need to do the following for them to work:

- Set the class of the prototype cell to our subclass of `UITableViewCell`.
- Wire up our subviews to our `IBOutlets`.
- Set the cell identifier to whatever we will use in `dequeueReusableCellWithIdentifier:`
- Implement the `UITableViewDataSource` protocol.

There is an example in the Week5 folder [here](https://github.com/zdavison/DIT.iOS1/blob/master/Week5/PrototypeCells).

