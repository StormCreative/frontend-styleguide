## Storm Creative Media CSS Styleguide - Version 1.3

Last updated: 27/05/2014

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
  * [BEM](css.md#bem)
  * [js-hooks](css.md#js-hooks)
  * [Format](css.md#format)
  * [Layout](css.md#layout)
  * [Commenting](css.md#comments)
  * [SASS Functions](css.md#sass-functions)
* [Pegisis framework](css.md#pegisis-framework)
  * [Structure](css.md#structure)
  * [Components](css.md#components)
  * [Config](css.md#config)
  * [Elements](css.md#elements)
  * [Fonts](css.md#fonts)
  * [Framework](css.md#framework)
    * [Grid](css.md#grid)
  * [Mixins](css.md#mixins)
    * [Media Queries](css.md#media-queries)
    * [Image Replacement](css.md#image-replacement)
    * [Sprites](css.md#sprites)
    * [Retina](css.md#retina)
    * [Prefixes](css.md#prefixes)
* [Admin system](css.md#admin-system)

---
### Initial setup

The CSS stylesheet language being used is SASS, which is a Ruby Gem and can be installed via the command line. This language is also available with Compass which is another framework that is used at Storm. Compass is primarily used for the generation of our sprites but as SASS is used we can also use Compass to help run this.

#### Installation

Compass is another open source CSS authoring framework, just like SASS. Compass, however, also uses SASS so this will implement nicely into our current way of building. Firstly, we need to ensure that the compass gem is installed on our machine. Access the terminal and within the main directory run the install command:

<pre>
  <code>
    sudo gem install compass
  </code>
</pre>

Then press enter, provide your password and press enter again. This will then install compass onto your machine as well as SASS.

If you already have compass installed just make sure you update your version of compass by running a system gem update in terminal:

<pre>
  <code>
    sudo gem update --system
  </code>
</pre>

Followed by the gem install compass. For more help on installing or upgrading compass please visit the [compass website](http://compass-style.org/install/).

---
#### Checking configurations

Now that we have successfully installed compass onto our machine, we make sure we have the correct and most up-to-date version of Pegisis. We then need to access the root directory and locate the file called `config.rb`, then open that file up within sublime (or another text editor).

You will notice that the configurations are already set up to the correct paths, but if for some reason a path needs to be changed then this will be the file to change them. The setup already is show below as a reference: 

```ruby
  

    http_path = "/"
    css_dir = "assets/styles"
    sass_dir = "assets/styles/sass"
    images_dir = "assets/images"
    relative_assets = true

```

The `relative_assets` is set to true as we want the path for our background sprite to have the `../images` path rather than our images_dir path of `assets/images`.

---
#### Running compass

Like SASS when we run the shell command to watch for changes within our stylesheets, we run a command within terminal called `compass watch`. Navigate to the directory of your project, in this case mine is Pegisis and run the command.

<pre>
  <code>
    cd Dropbox/Sites/Pegisis
    compass watch
  </code>
</pre>

This will now run SASS and also look for any other changes within the compass directories such as our images folder. So now we don't need to run `sh sass.sh` anymore as the above command will do it for us.

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

#### BEM

Another way to apply good class naming is to use a front-end methodology called BEM (Block, Element, Modifier). We try to use BEM as much as possible as this helps us to have reusable but specific class names. The idea of BEM is to help create the layout into blocks and give a reasonable class name to them and then apply that class name with an extension to all elements or blocks held within. 

##### Blocks

When building a 'component', the block name should be a relevant name for the component. If we were creating our navigation for example we would call the class 'navigation'. This is our block and is telling us this is the navigation. Within here we might have a logo and navigation links. Within here we can add an element for our logo, but we can add another block within the navigation block for our links.

```html


  <nav class="navigation">
    <a href="#">Logo</a>
    <ul class="navigation-links">
      <li><a href="#">Link 1</a></li>
      <li><a href="#">Link 2</a></li>
      <li><a href="#">Link 3</a></li>
    </ul>
  </nav>

```

As shown we have just added another block for our links called 'navigation-links'. We can now apply the element classes onto the logo and the links.

##### Elements

An element is a container within a block and can never appear outside of a container with the block name on. For example using the classes for our navigation we can apply the following classes to our elements like so:

```html


  <nav class="navigation">
    <a href="#" class="navigation__logo">Logo</a>
    <ul class="navigation-links">
      <li class="navigation-links__link"><a href="#">Link 1</a></li>
      <li class="navigation-links__link"><a href="#">Link 2</a></li>
      <li class="navigation-links__link"><a href="#">Link 3</a></li>
    </ul>
  </nav>

```

Notice how the extension to show that the element (held within its container block) is double underscore `block__element` this signifies that this is an element extension to the block. It is imported to use the block class name first followed by the element extension and is relevant to what block it is held in. With the navigation example above notice how the navigation logo name is related to the navigation block and the navigation links are related to the navigation-links block.

##### Modifiers

Modifiers should only be applied to an element if the block or element class already exists on the element. So using our current example if we wanted to apply a different colour to one of our links we would do the following: 

```html


  <nav class="navigation">
    <a href="#" class="navigation__logo">Logo</a>
    <ul class="navigation-links">
      <li class="navigation-links__link"><a href="#">Link 1</a></li>
      <li class="navigation-links__link navigation-list__link--red"><a href="#">Link 2</a></li>
      <li class="navigation-links__link"><a href="#">Link 3</a></li>
    </ul>
  </nav>

```

Notice how the extension to show a modifier has been applied is double hyphen and is only added to a current block / element with the relevant class. This shows that it using that current class like the rest but has been modified to change some specific styling. A modifier doesn't have to be just applied to an element but can also be applied to a block, so if we wanted to change our navigation background on a certain page or specific point of the website scroll we could apply a modifier like so: `navigation navigation--alternative`.

For more information about BEM or understanding the syntax better please visit [this post](http://csswizardry.com/2013/01/mindbemding-getting-your-head-round-bem-syntax/).

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

    .services-list {
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
            <ul class="services-list">
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
    .services-list,
    .products-list {
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

Heres a list of sass functions that we use within our styling and what they do.

* `&:` - used when need to add to a class using pseudo elements, first-child or hovers eg: `&:before` this will add the pseudo onto the class we are in
* `$` - used to declare a variable eg: `$site-width`, `$brand-colour`
* `@include` - used to include a [mixin](ccs.md#mixins) within our selector (class)
* `lighten()`, `darken()` - used to lighten or darken a colour by a given percentage eg: `color: darken(#ED1B24, 10%);`

---
### Pegisis Framework

The Pegisis Framework is the base for all Storm projects. Once you have setup Pegisis into a project if you navigate to the styles folder you will find the CSS / SASS setup has already been completed along with some handy, mixins, variables and structure setup. This section will cover everything held within this CSS Framework. 

#### Structure

The folder structure used within the framework breaks up all our .scss files into relevant areas which will then be imported into our main file of structure. Examples of the folders used are shown below with the folder names as the headings with the relevant information / elements that should be included to which folder.

##### Components

The components folder is used to store all sections across the site that are used within our includes or could be sections of the site that are unique, used across multiple pages or an actual page. Typically the standard imports that will go into the components folder would be: navigation, header, aside, footer. We would then build on this and include imports such as carousels, galleries, login areas, dashboards etc. If we need to have a unique page such as a contact page this could also be added in here.

##### Config

Variables and Settings are the two files that are used within the Config folder. The Settings file shouldn't really be touched as this has all the style setup for the framework which includes the setup of image paths, sprites, media queries and grids. This file should only be touched if you need to turn media queries or grid off and not use them within a project. The other file variables however, is where all the sites shortcuts are entered and changed. Variables are used to help speed up development as we can assign values to them and can be used as a properties values. eg: `$brand-colour: #000;` can be used within a selector (class) like so:

```scss


    .nav {
      background: $brand-colour;
    }
    
    // Will display as
    .nav {
      background: #000;
    }

```

By assigning variables we can use them multiple times wherever they might be used and can help not only speed up development as they are already assigned, but will help keep consistency across the site with colours, fonts, widths but also if a change needs to be made it will be made quicker as will change wherever the variable is used and saves hunting all the files to find where a styling value for a property has been used.

##### Elements

These are all the small parts of the site that help build up our components. The Elements folder is used primarily for buttons, forms, tables, tabs and error messages for example. Within each import we would relate all styles to the elements across the site in here. Eg: all buttons inside the _buttons.scss file with a breakup of comments of what each button is.

##### Fonts

Display all the @font-face fonts styling and font-awesome files within this folder. Make sure that the files are imported into our `_structure.scss` file and at the top of this file as the fonts will need to be loaded in first and also be shown.

##### Framework

This is the folder that will hold our structure file which all imports will be held. This file is then imported into our layout.scss file which is used by the browser to read all the styles. The other main file within here is `_grids.scss`.

##### *Grid*

Grids are used to help create a column structure to a website. The grid system we use is build in-house using other methods of grid and compiled into one. To use grids it must first be imported into the main `_structure.scss` file and within the `config/_settings.scss` the variable `$grid` should be set to true.

Within the HTML the parent block must use a class of `grid` and its children (next elements within the block) have a class of `grid__????`. The question marks are the width that we want to set for our column. The class names with the values are show below:

```scss


    // Grid Full
    .grid__full {
        width: 100%;
    }

    // Grid half
    .grid__half {
        width: 50%;
    }

    // THIRDS
    // Grid third
    .grid__third {
        width: 33.33333%;
    }

    // Grid two third
    .grid__two-third {
      width: 66.66666%;
    }

    // QUARTERS
    // Grid quarter
    .grid__quarter {
        width: 25%;
    }

    // Grid three quarter
    .grid__three-quarter {
        width: 75%;
    }

    // FIFTHS
    // Grid fifths
    .grid__fifth {
        width: 20%;
    }

    // Grid two fifths
    .grid__two-fifth {
        width: 40%;
    }

    // Grid three fifths
    .grid__three-fifth {
        width: 60%;
    }

    // Grid four fifths
    .grid__four-fifth {
        width: 80%;
    }

```

If the spacing between each column needs to be increased or made smaller then within the `config/_variables.scss` file change the variable value for `$grid-margin` to the spacing you require. 

Please note that if you try to apply a grid class within a grid class it will not work correctly so use the grid to break up the site into sections for the widths and apply styling to any extra columns inside.

##### Mixins

Some things in CSS are a bit tedious to write, especially with CSS3 and the many vendor prefixes that exist. A mixin lets you make groups of CSS declarations that you want to reuse throughout your site. Below are descriptions of mixins that we currently use (made in-house) and what they do. To use a mixin we must make sure we use the command `@include mixin-name`.

##### *Media Queries*

Responsive design is becoming more a part of the team projects so a media queries mixin was created which will target devices 568px or below showing mobile designs and anything greater will show desktop styling. To help improve this speed development, be easier to use and work with ie8! this mixin ticks all the boxes.

To make the mixin work we have to import it first into the `_structure.scss` file make sure that the variable in our config/settings `$MQs` is set to true and that a stylesheet called nomq.scss is created with the main stylesheet of `layout` imported into this and our variable `$MQs` is at the top with the value set to false. We need to do this so that ie8 will read this stylesheet as normal content and this will then work for desktop as they don't read media queries.

The media query mixin is now nearly ready to use but we need to check one more thing before it can be used. We need to navigate to our core folder within Pegisis, and then open up the settings folder and then site.php. We have to make sure that we set the question marks `$settings[ 'MEDIA_QUERIES' ] = ????;` to TRUE.

The mixin is all setup and ready to use. To use this we need to include it within a class after we have entered all our styling for the mobile design. As when we build mobile-first we make sure all the mobile styles are done first and then enter our desktop styling after using the mixin `@include bp(desktop)` like so:

```scss

  .nav {
      background: #FFF;
      color: #000;
      padding: 0.5em;

      // Add our desktop styling for devices 569px >
      @include bp(desktop) {
          background: #CCC; // This will overwrite our mobile background colour for devices 569px or greater, but lower will keep the previous colour
          text-align: center; // The text will only align center on desktop versions
      }
  }

```

Please note: To NOT use media queries within a site that isn't responsive then change the values of all the variables mentioned above to false.

##### *Image replacement*

If we need to create a link or have a logo / image which needs to have text for SEO purposes instead of inserting it in our HTML as an image we can apply another element tag such as an 'a' tag and simply use image replacement to keep the text but replace it with the image / logo we require. This helps keep up to web standards but also have a visible link. To use this simply make sure all the dimensions for the image are within the class styling along with the background image you are using and include the mixin like this: `@include img-replace;`

##### *Sprites*

Sprites are used to group multiple images into one mapped file. This will store all background images in one safe file which will help compress the file size and can speed up browser processing. To find out how to use the sprite within a project please read the [sprite manual](sprite-manual.md) which is also found within this series of documents for the Frontend styleguide.

##### *Retina*

Retina display devices are becoming more apparent so when we look at our images on these devices they look a little pixelated and not as sharp as they should be. To do this we can either use the sprite for our background images or we can apply our retina mixin to a class (mainly for header backgrounds as they are not in our sprites) like so:

```scss


  .header {
      background: url("../images/home-header.png") 0 0 no-repeat;

      // The mixin being called in and need to make sure that we add background and background-size within the selector
      @include retina {
          background: url("../images/retina/home-header_2x.png") 0 0 no-repeat;
          background-size: 100%;
      }
  }

```

##### *Prefixes*

One main shortcut that we use is the mixin for prefixes, a prefix are a way for browser makers to add support for new CSS features like so: `-webkit-` would apply styling to webkit browsers. They can only be applied to CSS3 features and the ones listed below are the ones we use and how to use them:

```scss
  
  * {
      @include box-sizing(border-box); // used as the start for every project as we want to apply margins and paddings within a block and not outside
  }

  .example {
      // Apply rounded corners to our class
      @include border-radius(0.5em);

      // Apply box shadow to our class
      @include box-shadow(5px 5px 5px #CCC);

      // Apply a transition to our class
      @include transition();
  }

```

All the examples above are the main ones used across projects and will target all browsers.

---
### Admin system

Our contact management system, uses the same coding style as above but instead of running compass straight from our project folder within terminal we have to navigate to the admin folder. Once navigated to this folder run compass watch and then styling changes will then take effect. Also, within the admin folder it has its own config.rb file with the correct paths set up solely for the admin system.