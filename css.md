## Storm Creative Media in-house CSS Styleguide

To keep code tidy, maintainable and a little less ugly we need to adhere to a unified Styleguide across the team. This document will cover the techniques and preferred practise by Storm Creative development team.

Consistency is key, a common formatting must be followed at all times. This is achieved through consistent syntax, commenting and naming conventions.

---
### Initial setup

The CSS stylesheet language being used is SASS, which is a Ruby Gem and can be installed via the command line. For more information and how to install SASS please use: [http://sass-lang.com/](http://sass-lang.com/)

---
### Folder structure
---

It is important that we have a home for our code so as developers we know where we can access it at any given time. All stylesheets are stored within the assets folder of our directory under a subfolder of styles.  Within this subfolder is another folder, which is called sass. This will store all the sass code being used for that particular project. 

* assets
	* styles
		* sass
			* configurations
         	* components
         	* fonts
         	* layout
         	* mixins

More folders are added as shown above to the sass folder and this is so we can import styles into our main sheets without the duplication of code everywhere and saves time trawling through each file looking for a specific section of code to make a change, so by placing these files within the proper subfolders is important. Only make an import if it is necessary and will be used again in another sheet.
-->

###Structure

When writing out our CSS code it is essential that we make our code clean, using correct standard documentation, which is also informative for not only ourself to remember what the code does, but also for other programmers to follow as they might need use the code at a later date. Create a seperate stylesheet for each page is ideal so then there is a relation to the html page, which saves time trawling through a single sheet to find what you want. Don’t duplicate code, make use of the imports and only include what you require for that page. If a style is reusable make it an import, if its only relevant to that page type the code in that stylesheet.

When naming our files if they are a going to be used to produce a css file they are named with the extension .scss within the sass folder. This will generate a .css file in our css folder for which our html can read. When naming this file make sure it is relevant to what it will be used for so if its for our index.php file a name such as homepage.scss is relevant as we know that is the homepage stylesheet. If we need to break up a word for a file use hyphens not underscores eg: sub-page.scss and not sub_page.scss. Only use the underscores for when we are creating an import file within a certain folder, and save the file as _filename.scss so it does not generate a new stylesheet (this is not going to be a sheet, its importing our styles to our stylesheet instead).

###Class naming convention

Applying styles to html requires the use of classes (NOT ID's - it takes 256 classes to override one ID) so that we can give specific styling to elements and will not be included on that element anywhere else in the site unless it has the same class. Try to only apply just ONE class to an element and not multiple classes, only in certain scenarios should we do this and will be explained later. When we give a name to a class it so important for the class to be specific but also generic to what it is being applied to. Make it reusable. Examples of good class names are shown below:

```scss

	.className {} // Not good
	.CLASSNAME {} // Not good
	.class_name {} // Not good
	.class-name {} // Good

```
Just like our folder naming make sure if we need to break up a word or attach other words together that they are connected with hyphens. Ideally, we want to apply BEM class name conventions too which would look something like this:

```scss

	.services {} // service Block
	.services__list {} // service Elements
	.services__list--websites {} // service Modifier

```
Notice that double underscores are used to seperate our block from our elements this is to easily recognise a class is part of the block. This is the only time it is acceptable to have the use of underscores for class naming.

###js-hooks

If we are applying javascript to a class then we apply a js-hook to the name. This allows us to reuse the class for both javascript and css, knowing that is hooked to a javascript file. An example would be .js-popup and from this we know what the action is and can now use that class for styling purposes aswell.

###Code markup

When compiling our code to our page leave comments at the top of the page explaining what the page is, with a list of the imports included. These also need to be commented briefly explaining what it is used for. It is important to remember that it is a Cascading Style Sheet so put the imports in an order that reflects the layout of the html page and intern helps to find where our code is within the sheet and the chances of styles being overwritten. 

```scss

/* Homepage - All styles for the homepage will be displayed here */

@import "configurations/variables"; /* All variables regarding the sites generic featues are included within this file */
@import "layout/structure"; /* This includes the page structure = html, body, wrapper and container classes */
@import "components/navigation"; /* This has all the styles for the navigation */

/* I show up as a comment in the produced css file */
// I am a single line comment and wont show up in the css file when generated

```

Part and parcel of programming is producing clean, and well presented code which can be followed easily. Some of the ways to help do this are displayed below:

* Comment
* Indent = ideally 4 spaces
* Provide a space between a property and a value. ( color: #FFF; )
* Keep properties in alphabetical order (wherever possible)
* Ensure prefixes line up
* Nesting code
* Not written in one line blocks

An example of good code markup:

```scss

/* Homepage services widget section - this includes all the services within the services section on the homepage */

.services {
	background: #FFF; /* use short-hand (wherever possible) */
  	border: 1px solid #000;
  	list-style: none;
  	margin: 0; /* if 0 does not need to have px after */
  	padding: 8px;

  	/* CSS3 features are kept seperate and have the comment of CSS3 to let us know */
  	-webkit-border-radius: 4px;
       -moz-border-radius: 4px;
            border-radius: 4px;

    .services__list {
    	color: #ED1B24;
    	display: inline-block;
    	font-family: 'Arial';
    	font-size: 16px;
    	padding: 8px 4px; /* use short-hand = 8px (top,bottom) and 4px (left,right) */
    }
}

```


