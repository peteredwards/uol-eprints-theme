uol-eprints-theme
=================

ePrints theme based on University of Leeds branding

This theme contains static files (CSS, Javascript, XML page templates) to determine the look and feel of an eprints repository. All files are loaded in addition to the core eprints files, and much of the look and feel of the repository pages is governed by them - the main changes are in the page layout, with some changes in typography and other formatting.

The CSS and JS for the theme are maintained by a separate project - [University of Leeds Design System](https://designsystem.leeds.ac.uk/).

Updating the theme on the server
--------------------------------

1. (cmd) git pull from the eprints directory /usr/share/eprints to get the latest changes.
2. (web) Go to Admin->System Tools->EPrints Bazaar->Developer Tools and click on the Edit button for the theme, then click on the Save and return button (this will re-calculate the checksums for the files in the theme)
3. (web) Switch to the Installed tab and disable the theme (this will generate error messaages concerning the static pages in the theme).
4. (cmd) Remove any static pages from the repository (rm ~/archives/test1/cfg/lang/en/static/*.xpage*)
5. (web) Enable the theme
6. (cmd) Generate static files for the repository (~/bin/generate_static test1)

