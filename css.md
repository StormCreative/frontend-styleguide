## Storm Creative Media in-house CSS Styleguide

To keep code tidy, maintainable and a little less ugly we need to adhere to a unified Styleguide across the team. This document will cover the techniques and preferred practise by Storm Creative development team.

Consistency is key, a common formatting must be followed at all times. This is achieved through consistent syntax, commenting and naming conventions.

<!--
---
### Initial setup
---

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

When writing out our CSS code it is essential that we make our code clean using correct standard documentation, which is also informative for not only yourself to remember what the code does but also for other programmers to follow as they might need use your code at a later date.  Create a stylesheet for each page is ideal so then there is a relation to the page and you know where to find the styles for a certain page. Don’t duplicate code, make use of the imports and only include what you require for that page. If a style is reusable make it an import, if its only relevant to that page type the code in that stylesheet.

###Code markup

When compiling our code leave comments at the top of the page explaining what the page is with a list of the imports included. These also need to be commented briefly explaining what it is used for. 

<pre>
	<code>
		// Homepage - All styles for the homepage will be displayed here 

		@import “components/navigation”; // This has all the styles for the navigation
		
	</code>
</pre>