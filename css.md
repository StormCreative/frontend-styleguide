## Storm Creative Media in-house CSS Styleguide

To keep code tidy, maintainable and a little less ugly we need to adhere to a unified Styleguide across the team. This document will cover the techniques and preferred practise by Storm Creative development team.

Consistency is key, a common formatting must be followed at all times. This is achieved through consistent syntax, commenting and naming conventions.

---
### Initial setup
---

---
### Folder structure
---

It is important that we have a home for our code so as developers we know where we can access it at any given time. All stylesheets are stored within the assets folder of our directory under a subfolder of styles.  Within this subfolder is another folder, which is called sass. This will store all the sass code being used for that particular project. 

> assets
	> styles
		> sass
			> configurations
			> components
			> fonts
			> layout
			> mixins

More folders are added as shown above to the sass folder and this is so we can import styles into our main sheets without the duplication of code everywhere and saves time trawling through each file looking for a specific section of code to make a change, so by placing these files within the proper subfolders is important. Only make an import if it is necessary and will be used again in another sheet.