## Storm Creative Media in-house CSS Styleguide

To keep code tidy, maintainable and a little less ugly we need to adhere to a unified Styleguide across the team. This document will cover the techniques and preferred practise by the Storm Creative development team.

Consistency is key, a common formatting must be followed at all times. This is achieved through consistent syntax, commenting and naming conventions.

---
What this document will cover:

* [Initial Setup - SASS](css.md#initial-setup)
* [Folder Setup](css.md#folder-setup)
* [Setting up files](css.md#file-naming)
* Imports
* CSS structure / Layout / Format / Nesting / Indentation
* Class names / js-hooks
* BEM
* StyleDocco
* Commenting
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

Comment out the sass watch that we don't want to use. In the example the css generated will be un-minified, if we commented this out and uncommented the compressed version then when we run sass in the command line with this line of code it will compress the css and make it minified.

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

This then starts running sass from our command line and any changes made in the sass files / folders updates in the css folder. We only need to add this code the first time when we start the project, then after we can simply run the following line of code in the command line:

<pre>
  <code>
    sh sass.sh
  </code>
</pre>

---
### File naming

When it comes to creating the files for our stylesheets we have to make sure we use the right naming conventions in order for SASS to run correctly. If we are creating a main stylesheet that will hold all styles and be used within the HTML of our site we would give the file a relevant name such as 'styles' with the extension of .scss and add create this within the sass main folder.

* sass
  * folder
  * styles.scss

And this will generate our css file within the styles folder so would look like this.

* sass
  * folder
  * styles.scss
* styles.css

