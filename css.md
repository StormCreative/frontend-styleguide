## Storm Creative Media CSS Styleguide - Version 1.1

Last updated: 30/01/2014

To keep code tidy, maintainable and a little less ugly we need to adhere to a unified Styleguide across the team. This document will cover the techniques and preferred practise by the Storm Creative development team.

Consistency is key, a common formatting must be followed at all times. This is achieved through consistent syntax, commenting and naming conventions.

---
What this document will cover:

* [Initial Setup - SASS](css.md#initial-setup)
* [Folder Setup](css.md#folder-setup)
* [Setting up files](css.md#file-naming)
  * [Imports](css.md#imports)
* [CSS Structure](css.md#css-structure)
  * [Class names](css.md#class-names)
  * [js-hooks](css.md#js-hooks)
  * [Format](css.md#format)
  * [Layout](css.md#layout)
  * [Commenting](css.md#comments)
  * [SASS Functions](css.md#sass-functions)
* [Pegisis framework](css.md#pegisis-framework)
* Media Queries

---
### Initial setup

The CSS stylesheet language being used is SASS, which is a Ruby Gem and can be installed via the command line. For more information on how to install SASS please use: [http://sass-lang.com/](http://sass-lang.com/)

Once SASS is installed, create a file in the main directory called sass.sh and inside this file include the following code:

<pre>
  <code>
    #!/bin/sh

    #sass --style expanded --watch assets/styles/sass:assets/styles --debug-info
    sass --style compressed --watch assets/styles/sass:assets/styles

    exit 0

  </code>
</pre>

We comment out the sass watch that we don't want to use by displaying a hashtag `#` before it.

Our SASS setup is now complete, next the folder structure needs to be completed to get our SASS up and running.

---
### Folder setup

It is important that we have a home for our code so as developers we know where we can access it at any given time. All stylesheets are stored within the assets folder of our directory under a subfolder called styles. Another folder is added inside this, which is called sass. This will store all the sass stylesheets being used for that particular project. We must make sure that our folder setup matches that of our SASS command setup.

Note: All folder names are to be in lowercase.

* assets
  * styles
  	* sass
        * components
        * config
        * elements
        * fonts
        * framework
        * mixins

Extra folders have been added within our sass folder, within these folders we would store relevant files that we can [import](css.md#imports) into our main stylesheets. Examples would be our navigation, headers and footer within our components folder.

Now the main styles folder structure is set up open the command line (terminal) and access the directory for the project and run the following code:

<pre>
  <code>
    sass --style compressed --watch assets/styles/sass:assets/styles
  </code>
</pre>

We would use the compressed watch version as we want to compress our CSS from the beginning. The code is telling SASS to watch for any changes in our styles within the assets/styles/sass files and then update our .css files within the assets/styles folder (the same as the folder structure we have just created). We only need to add this code the first time when we start the project, then after we can simply run SASS using the following line of code in the command line: `sh sass.sh`.

###### Note: if using the [Pegisis framework](css.md#pegisis-framework) we only need to run `sh sass.sh` as the initial setup of SASS is complete as well as our folder structure.

---
### File naming

When naming our files, IF they are a going to be used to produce a CSS file they are named with the extension .scss within the sass folder. This will generate a .css file in our styles folder for which our HTML can read. eg: `layout.scss` will generate via the SASS watch to be `layout.css` within our styles folder and this is the stylesheet we would use for the browser to read the styling. When naming this file make sure it is named relevantly to what it will be used for, so if its for our home.php page name the file as home.scss as we know that it is used for styles on the homepage. If we need to break up a word for a file use hyphens not underscores eg: `sub-page.scss` and not `sub_page.scss`. Ideally we will only want to use one stylesheet and then add specific styles to pages via the components folder. Only use the underscores to name files when we are creating an import file within a certain folder like components, and save the file as _filename.scss so it does not generate a new stylesheet (this is not going to be a stylesheet .css file, its used to import styles to the relevant stylesheet instead).

#### Imports

An import must have the extension _filename.scss and be stored within one of our SASS folders. An import is used to include many SASS files into other files. We will mainly import all styles into a `_structure.scss` file where all the styling for our project will be held. 

To import a file into the other SASS files we simple add this line of code `@import "folder-name/file-name";`. Remember to add the import you just created into the structure file otherwise you will not see any styles appearing when you go to check within the browser.

The `_stucture.scss` file will then be imported into our main stylesheet(s) using the same process and will output all our styles in a CSS format that browsers can read.

---
### CSS Structure

When writing out our CSS code it is essential that we make our code clean, using correct standard documentation, which is also informative for not only ourselves to remember (what the code actually does), but also for other programmers to follow as they might need to use the code at a later date. When writing out our CSS it is essential we don't duplicate code! At times there will be incidents where we might need to adapt the styling of a class but we will only edit the specific styles and not copy over all the code. If we are using the same elements styling across multiple pages put the code within an import and call it in to the relevant stylesheet(s). This will help prevent duplication of code and can be edited within one place, makes everything generic and will speed up development time. Remember that CSS stands for Cascading Style Sheet which means that the styles lower down the sheet would overwrite the same styles at the top so its important to make sure that we put the styles in the correct order and that we are not repeating ourselves otherwise some styles (if in the page twice) would be overwritten and show as duplicated code.

#### Class names

Applying styles to HTML requires the use of classes (NOT ID's - it takes 256 classes to override one ID) so that we can give specific styling to elements. Try to only apply just ONE class to an element eg: `header` and all the styles for our headers will adopt the header styling. If we need to apply different backgrounds or adapt styling specifically to this header we can add another class into our HTML like so: `header header-service`. This is telling us that we are using our header class for header styles, and header-service is relating to the page we are on, with specific styling for that header. This could be our different background-image for example. We try not to have too many multiple classes, and only in certain scenarios should we do this. Where we need to adapt styling etc like the example above. When naming our classes try to be as relevant as possible and follow the same naming conventions. eg: `intro-title, intro-copy, intro-image` not only are these relevant to our intro but it is telling us what each element is and can be used for every page that has an intro. When naming a class, also think could this class be used again in the website? Don't be too specific to an element unless you know its not going to be reused. Examples of class names are shown below:

```scss


  .className {} // Not good
  .CLASSNAME {} // Not good
  .class_name {} // Not good
  .class-name {} // Good
  .class {} // Good

```

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
* Nesting code - NO MORE THAN 3 LEVELS DEEP and nest if no class name is added, or is specific to what you are styling eg: (p tag within a class and we want to style those specific p tags)
* Not written in one line blocks
* Adding relevant class names and making sure if we need to target specific tags to nest them within the block class they are held

An example of good code markup:

```scss
    

    /************************************************
      
      SERVICES
      ========

      Create a comment area that can be used to
      separate different sections within the
      stylesheet. Within here also write a short
      description of what is being included. 

    *************************************************/
    
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
    }

    .services__list {
        color: #ED1B24;
        display: inline-block;
        font-family: 'Arial';
        font-size: 1em; // use em measurement
        padding: 0.5em 0.25em; // use em measurement and use short-hand = 8px (top,bottom) and 4px (left,right)
    }

```

When nesting our CSS it is important that we only nest what is relevant to a class. If a style (class) is used again across the site but not directly within a class then we shouldn't nest this as every level deeper we go the styling becomes more specific and will effect speed time for the browser to read it.

#### Layout

Heights and widths shouldn't be be applied to elements. Heights and widths should only be applied for a dimensions preset such as: images, sprites and background images. If you need to set a height on an element use line-height which is far more flexible. The only time should we really need to apply a width should be onto our grids system. The styles on the grid classes shouldn't be altered and should only have the widths on them, if we need to style that element add another class and apply the styling onto that. The layout is also our main stylesheet which will have the structure imported into it and is the base for our website.

#### Comments

You should document and comment code as much as you possibly can, what may seem or feel transparent and self explanatory to you may not be to other developers. Once you have written a block of code explain what you have just done. This will help when looking at your code at a later date but more importantly works with the document styler we use called [StyleDocco](http://jacobrask.github.io/styledocco/). StyleDocco will generate a document of our commented elements in HTML and CSS so we can see them and know what styles / classes to use. To use StyleDocco make sure that the gem is already installed and run the rake command `rake styleguide` when using our [Pegisis framework](css.md#pegisis-framework).

```scss

    
    /*

    STYLEDOCCO
    ==========

    This is an example of how we should comment our elements so that it will work with StyleDocco.

    Within this stylesheet you will find styles for:

    - SERVICES
    - LIST OF OTHER CSS CLASSES / ELEMENTS

    Here we will copy over the relevant HTML that we used to apply our styles to, making sure that it is correctly indented.

        <section class="services">
            <ul class="services__list">
                <li>Service 1</li>
                <li>Service 2</li>
                <li>Service 3</li>
            </ul>
        </section>

    */

    /*
     * I'm another way of commenting an area of block CSS but will not work with StyleDocco very well.
     */

    // Single line comment that can be used on our CSS properties to describe what they are doing.

```

#### DRY

Don't Repeat Yourself. Nobody wants to be writing the same code over again or duplicating their code, so the best way is to not repeat yourself, once you have written your styling properties think how can I simplify this more? Are two things doing the same? Heres an example of coupling up styles to eliminate this problem:

```scss
    

    // Both our classes use these properties so we couple them up by displaying them one under the other
    // NOT INLINE and separated with a comma.
    .services,
    .products {
        background: #ED1B24;
    }

    // Services styling
    .services {
        padding: 1em; // 16px
    }

    // Products styling
    .products {
        padding: 0.5em 1em; // 8px 16px
    }

    // Services and products listings
    .services__list,
    .products__list {
        font-family: 'Arial';
        font-size: 1em; // 16px
        letter-spacing: -0.32em; // remove our margin on the li's so we can display them inline block and have a true margin
        list-style: none;
        padding: 0;

        li {
            display: inline-block;
            letter-spacing: normal;
            vertical-align: middle;
        }
    }

    // Services list styling
    .services__list {
        color: #FFF;
    }

    // Products list styling
    .products__list {
        color: #333;
    }

```

#### SASS Functions

Heres a list of sass functions that we use and what they do.

* `&:` - used when need to add to a class eg: `&:before` this will add the pseudo onto the class we are in
* `$` - used to declare a variable eg: `$site-width`
* `@include` - used to include a mixin within our selector (class)
* `lighten()` `darken()` - used to lighten or darken a colour by a given percentage

---
### Pegisis Framework

To be added with Pegisis and Curtiss

#### Media Queries

#### Grid

#### Mixins

- Retina
- Image replace
- Prefixes
- Opacity
- Font size