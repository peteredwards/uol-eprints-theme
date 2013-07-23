uol-eprints-theme
=================

ePrints theme based on University of Leeds web toolkit

This theme contains static files (CSS, Javascript, XML page templates) to determine the look and feel of the repository. All files are loaded in addition to the core eprints files, and much of the look and feel of the repository pages is governed by them - the main changes are in the page layout, with some changes in typography and other formatting.

Requirements
------------

The CSS file used by the theme (styles/auto/zzzz_uol.css) is generated from the LESS files in the styles/less directory, and is minified as part of this process. It is then automatically compiled into the core eprints CSS files. Javascript is treated in much the same way, with source and minified files in the /javascript/src directory, which are then concatenated to form javascript/auto/zzzz_uol.js.

The theme is under version control (using git), and has a public repository at https://github.com/essl-pvac/uol-eprints-theme.git. The eprints user on this server can pull and push changes to this public repository using a shared SSH key. The repository root is at the root of the eprints installation (usr/share/eprints) which is also the eprints user home directory.

Updating the theme on the server
--------------------------------

1. (cmd) git pull from the eprints directory /usr/share/eprints to get the latest changes.
2. (web) Go to Admin->System Tools->EPrints Bazaar->Developer Tools and click on the Edit button for the theme, then click on the Save and return button (this will re-calculate the checksums for the files in the theme)
3. (web) Switch to the Installed tab and disable the theme (this will generate error messaages concerning the static pages in the theme).
4. (cmd) Remove any static pages from the repository (rm ~/archives/test1/cfg/lang/en/static/*.xpage*)
5. (web) Enable the theme
6. (cmd) Generate static files for the repository (~/bin/generate_static test1)
