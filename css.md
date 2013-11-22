## Storm Creative Media in-house CSS Styleguide

To keep code tidy, maintainable and a little less ugly we need to adhere to a unified Styleguide across the team. This document will cover the techniques and preferred practise by the Storm Creative development team.

Consistency is key, a common formatting must be followed at all times. This is achieved through consistent syntax, commenting and naming conventions.

---
What this document will cover:

* [a relative link](css.md#initial-setup)Initial Setup - SASS
* Folder Structures
* Setting up files
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
### Folder setup and structure

It is important that we have a home for our code so as developers we know where we can access it at any given time. All stylesheets are stored within the assets folder of our directory under a subfolder called styles. Another folder is added inside this, which is called sass. This will store all the sass stylesheets being used for that particular project. 

* assets
	* styles
		* sass
			* configurations
      * components
      * elements
     	* fonts
      * framework
      * mixins

More folders are added as shown above to the sass folder and this is so we can import styles into our main sheets without the duplication of code everywhere. This saves time trawling through each file looking for a specific section of code to make a change, so by placing these files within the proper subfolders is important. Only make an import if it is necessary and can be usable again in another sheet.

Now the folder structure is set up open the command line and access the directory for the project and run the following code:

<pre>
  <code>
    sass --style expanded --watch assets/styles/sass:assets/styles
  </code>
</pre>

This then starts running sass from our command line and any changes made in the sass folder updates in the css folder. We only need to add this code the first time when we start the project, then after we can simply run the following line of code in the command line:

<pre>
  <code>
    sh sass.sh
  </code>
</pre>



