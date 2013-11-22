## Storm Creative Media in-house CSS Styleguide - Version 1.0

To keep code tidy, maintainable and a little less ugly we need to adhere to a unified Styleguide across the team. This document will cover the techniques and preferred practise by the Storm Creative development team.

Consistency is key, a common formatting must be followed at all times. This is achieved through consistent syntax, commenting and naming conventions.

---
What this document will cover:

* [Initial Setup - SASS](css.md#initial-setup)
* [Folder Setup](css.md#folder-setup)
* [Setting up files](css.md#file-naming)
* [CSS Structure](css.md#css-structure)
  * [Class names](css.md#class-names)
  * [BEM](css.md#bem)
  * [js-hooks](css.md#js-hooks)
  * [Format](css.md#format)
  * Imports
  * Layout
  * Commenting
  * SASS Functions
* Framework
* Grids
* Media Queries

---
### Initial setup

The CSS stylesheet language being used is SASS, which is a Ruby Gem and can be installed via the command line. For more information on how to install SASS please use: [http://sass-lang.com/](http://sass-lang.com/)

Once SASS is installed, create a file in the main directory called sass.sh and inside this file include the following code:

<pre>
  <code>
    #!/bin/sh

    sass --style expanded --watch assets/styles/sass:assets/styles --debug-info
    #sass --style compressed --watch assets/styles/sass:assets/styles

    exit 0

  </code>
</pre>

Comment out the sass watch that we don't want to use. In the example the CSS generated will be un-minified, if we commented this out and uncommented the compressed version then when we run sass in the command line with this line of code it will compress the CSS and make it minified.

Now that the sass setup is complete, the folder structure needs to be completed to get our sass up and running.

---
### Folder setup

It is important that we have a home for our code so as developers we know where we can access it at any given time. All stylesheets are stored within the assets folder of our directory under a subfolder called styles. Another folder is added inside this, which is called sass. This will store all the sass stylesheets being used for that particular project. Note: All folder names are to be in lowercase.

* assets
  * styles
  	* sass
        * configurations
        * components
        * elements
        * fonts
        * framework
        * mixins

Extra folders have been added within our sass folder, within these folders we would store relevant files that we can [import](css.md#imports) into our main stylesheets. 

Now the main styles folder structure is set up open the command line (terminal) and access the directory for the project and run the following code:

<pre>
  <code>
    sass --style expanded --watch assets/styles/sass:assets/styles
  </code>
</pre>

This then starts running sass from our command line and any changes made in the sass files / folders updates in the CSS folder. We only need to add this code the first time when we start the project, then after we can simply run the following line of code in the command line: `sh sass.sh`

---
### File naming

When naming our files, if they are a going to be used to produce a CSS file they are named with the extension .scss within the sass folder. This will generate a .css file in our styles folder for which our HTML can read. When naming this file make sure it is relevant to what it will be used for, so if its for our home.php name the file as home.scss as we know that it is used for styles on the homepage. If we need to break up a word for a file use hyphens not underscores eg: sub-page.scss and not sub_page.scss. Only use the underscores for when we are creating an import file within a certain folder, and save the file as _filename.scss so it does not generate a new stylesheet (this is not going to be a sheet, its used to import styles to the relevant stylesheet instead).

---
### CSS Structure

When writing out our CSS code it is essential that we make our code clean, using correct standard documentation, which is also informative for not only ourselves to remember (what the code actually does), but also for other programmers to follow as they might need to use the code at a later date. When writing our our CSS it is essential we don’t duplicate code! At times there will be incidents where we might need to adapt the styling of a class but we will only edit the specific styles and not copy over all the code. If we are using the same elements styling across multiple pages put the code within an import and call it in to the relevant stylesheet(s). This will help prevent duplication of code and can be edited within one place, makes everything generic and will speed up time. Remember that CSS stands for Cascading Style Sheet which means that the styles lower down the sheet would overwrite the same styles at the top so its important to make sure that we put the styles in the correct order and that we are not repeating ourselves otherwise some styles if in the page twice would be overwritten and show as duplicated code.

#### Class names

Applying styles to HTML requires the use of classes (NOT ID's - it takes 256 classes to override one ID) so that we can give specific styling to elements. Try to only apply just ONE class to an element and not multiple classes, only in certain scenarios should we do this and will be explained later. When naming a class, think could this class be used again in the website? Don't be too specific to an element unless you know its not going to be reused. Examples of class names are shown below:

```scss


  .className {} // Not good
  .CLASSNAME {} // Not good
  .class_name {} // Not good
  .class-name {} // Good
  .class {} // Good

```

#### BEM

A front-end methodology that we use is a CSS naming convention called BEM (Block Element Modifier).

#### js-hooks

If we are applying javascript to a class then we apply a js-hook to the name. This is to let us know that the element is using javascript and IS NOT TO BE USED as a CSS name to style. If we need to apply styling to that element this is when we can apply an additional class for styling purposes. eg:

```html


  <div class="js-dropdown dropdown"></div>

```

#### Format

Part and parcel of programming is producing clean, and well presented code which can be followed easily. It is important that we follow a strict CSS approach so that everyone understands how the code is presented and what it is actually doing. The key elements when writing our CSS are outlined below:

* Comment
* Indent = ideally 4 spaces
* Provide a space between a property and a value. (color: #FFF;)
* Keep properties in alphabetical order (preferable) - helps identify quicker
* Ensure prefixes line up
* Nesting code - NO MORE THAN 3 LEVELS DEEP
* Not written in one line blocks

An example of good code markup:

```scss


    .services {
        background: #FFF; // use short-hand (wherever possible)
        border: 1px solid #000;
        list-style: none;
        margin: 0;
        padding: 0.5em; // use em measurement = 8px

        // CSS3 features are kept separate and have the comment of CSS3 to let us know
        -webkit-border-radius: 0.25em; // use em measurement = 8px
           -moz-border-radius: 0.25em; // use em measurement = 8px
                border-radius: 0.25em; // use em measurement = 8px

        .services__list {
          color: #ED1B24;
          display: inline-block;
          font-family: 'Arial';
          font-size: 1em; // use em measurement
          padding: 0.5em 0.25em; // use em measurement and use short-hand = 8px (top,bottom) and 4px (left,right)
        }
    }

```

When nesting our CSS it is important that we only nest what is relevant to a class. If a style (class) is used again across the site but not directly within a class then we shouldn't nest this as every level deeper we go the styling becomes more specific.

#### Imports

