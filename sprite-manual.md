## Storm Creative Media sprite manual - Version 1.0

Last updated: 27/05/2014

Due to troubles with the existing way we implemented sprites with images being lost, or overwritten, as well as the amount of time spent creating it within Fireworks, a new method for sprite generation was needed. Within this manual it will show you how to use the new sprite generator for Pegisis.

---

What this manual will cover:

* [Installation / Setup](sprite-manual.md#installation)
* [Checking configurations](sprite-manual.md#checking-configurations)
* [Running compass](sprite-manual.md#running-compass)
* [SASS setup](sprite-manual.md#sass-setup)
* [Image setup and generation](sprite-manual.md#image-generation)
* [Implementation of the mixin within our styles](sprite-manual.md#implementation)
* [Helpful pointers](sprite-manual.md#helpful-pointers)

---
### Installation

The sprite generator that we will be using is built with compass. Compass is another open source CSS authoring framework, just like SASS. Compass, however, also uses SASS so this will implement nicely into our current way of building. Firstly, we need to ensure that the compass gem is installed on our machine. Access the terminal and within the main directory run the install command:

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
### Checking configurations

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
### Running compass

Like SASS when we run the shell command to watch for changes within our stylesheets, we run a command within terminal called `compass watch`. Navigate to the directory of your project, in this case mine is Pegisis and run the command.

<pre>
  <code>
  	cd Dropbox/Sites/Pegisis
  	compass watch
  </code>
</pre>

This will now run SASS and also look for any other changes within the compass directories such as our images folder. So now we don't need to run `sh sass.sh` anymore as the above command will do it for us.

---
### SASS setup

Now that compass is running and watching for changes within our stylesheets we navigate to our `config/_settings.scss` file within our sass folder and make sure that we have imported the files we need for compass to work correctly. If you are using the most up-to-date version of Pegisis the files should already be imported, but if they are not then simply add:

```scss


	@import "compass/utilities/sprites";
	@import "compass/css3/background-size";

```

This will access the files run by compass and will help generate our sprite as well as applying the css3 mixin of background-size, which comes as part of the compass package. Alternatively, you can just `@import "compass";` on its own and this should import all features available to compass. As we only want to you use these two files selected we will only import those. Lastly, navigate to the `framework/_structure.scss` file and make sure that the sprite mixin has been imported otherwise the sprite will not work when trying to apply styling.

---
### Image generation

All of the setup for our compass framework is now in place, we have to actually add images so that compass can do its magic and generate an actual sprite image for us. First things first, create a folder within the images folder called `sprite`, and then create another called `sprite-retina`. These will be the folders for which we will store our images that we want to be included within our sprite. Example of how our structure should look is shown below:

<pre>
  <code>
  	- images
  		- sprite
  		- sprite-retina
  </code>
</pre>

The folder structure is now in place, next is to add the images to our folder. As like before we will export our images from fireworks / photoshop but into the relevant folder, if a normal sized background image is added then put this into the sprite folder, if a retina sized image, this will need to be included into the sprite-retina folder. There are a few points to take note of before saving each image. 

#####PLEASE READ CAREFULLY AND TAKE NOTICE:

- All images must be saved as `.png`
- The name of the image is important as it needs to be descriptive to what it is
- The image name will be used as part of the sprite include so can't be too long
- If you are providing a size to the images such as `small` then please provide an underscore before and not hyphenated as the image will NOT SHOW
- Please name the retina image EXACTLY the same as the original image but within the sprite-retina folder and NOT with the `_2x` extension, this has to be the same to be used within our include for styling purposes

You will notice that nothing has happened within our images folder and that the images are just sitting in their relevant folders with no sprite image being generated, to generate the sprite using compass' magic all we need to do is save a stylesheet and this will run the compass watch in the terminal and generate two images which will be used as our sprites.

Please note: This will have to be done everytime you add images to the sprite folders to ensure that your image has been added to the sprite. Also to make sure that an image is included in both folders as compass will not run and no styles will be updated.

---
### Implementation

Everything is set up and ready to go, all that is left to do is to actually add our image from the sprite into the class / styling we require it for. To implement this instead of using our old code for including the sprite mixin and plotting the co-ordinates ourselves, we only need to provide the image name! An example of how to use this is shown below:

```scss


	.logo {
		display: inline-block;

		@include sprite(company-logo);
	}

```

That is all we need to add, what the mixin will do is work out the co-ordinates for that specific image, the height and width of that image and its co-ordinates within the retina sprite. The css that will be generated is as shown:

```css


	.logo {
		display: block;
		background: url('../images/sprite-<generated-sprite-name>.png') 0 -375px no-repeat;
		height: 256px;
		width: 256px;
	}
		
	@media (min--moz-device-pixel-ratio: 1.5), (-o-min-device-pixel-ratio: 3 / 2), (-webkit-min-device-pixel-ratio: 1.5), (min-resolution: 1.5dppx) {
		.logo {
		    background: url('../images/sprite-retina-<generated-sprite-name>.png') 0 -375px no-repeat;

		    -webkit-background-size: 256px;
		    -moz-background-size: 256px;
		    -o-background-size: 256px;
		    background-size: 256px;
		}
	}

```

Notice that the height, width and background-size has already been calculated just by providing the correct image name.

Once that has been completed double check that your image is displaying for both normal and retina device screens. For helpful pointers please read the section below.

---
### Helpful pointers

Here are a few helpers that will help you when using the mixin to implement the sprite:

- Make sure that the layout for the sprite is set to horizontal or vertical to enable the sprite to work correctly. Currently there is an issue that breaks when a smart layout is set which is what we would ideally want but until a issue with the fix has been released, please refrain from using that layout.
