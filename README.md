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

Handover materials for roadmap
==============================

This directory contains some of the handover materials for the Roadmap project.

jacs.php
--------

This is a PHP array compiled from the information at:

http://www.hesa.ac.uk/content/view/1776/277/

The data structure was made from the CSV file which can be downloaded at this address,
and is a PHP associative array with the JACS subject code as key, and JACS subject
description as the value.

generate_jacs_xml.php
---------------------

This PHP script includes jacs.php and generates an eprints XML file (jacs3.xml) which
can be imported into eprints using:

    [eprints_bin]/import_subjects [repository_id] --xml jacs3.xml

For information on this command, see:

http://wiki.eprints.org/w/API:bin/import_subjects

This file will replace the default subjects (LCSH, if installed) with the JACS3
subjects - it doesn't add them as an additional subject tree. To import these subjects
in addition to an existing subject classification, you would need to configure
eprints (using the Admin backend) and change the <subjectid> field in this file.

More information on using multiple subject trees can be found here:

http://www.eprints.org/tech.php/thread-11624.html

leeds.php
---------

This is PHP data structure which is used to create the University of Leeds divisions
(organisation subject tree) for eprints. It is taken from information which can be
found at:

http://www.leeds.ac.uk/info/20029/faculties

Each organisational node is represented by an array with an ID (this has been made up,
but roughly follows acronyms in common usage for Faculties, Schools and Centres), a name
and an array containing the IDs of any other organisation in the tree which is 
identified as a parent node. This results in some Centres being present multiple times
in the tree (the Biomedical and Health Research Centre has four parents, for example).

generate_leeds_divisions_xml.php
--------------------------------

This PHP script includes leeds.php and generates and eprints XML file (leeds.xml) which
can be imported into eprints using:

    [eprints_bin]/import_subjects [repository_id] --xml leeds.xml

This file will replace the default divisions with the Leeds Faculties, Schools and Centres.

generate_leeds_subjects_xml.php
-------------------------------

This PHP script includes both leeds.php and jacs.php to create a single import file to
replace both the divisions and subject trees in eprints (leeds_subjects.xml) which
can be imported into eprints using:

    [eprints_bin]/import_subjects [repository_id] --xml leeds_subjects.xml

ckan-install.pp
---------------

This is a puppet script which was left unfinished - the intention was to install CKAN
(version 2.0) on roadmap2.leeds.ac.uk following the instructions here:

https://github.com/okfn/ckan/wiki/How-to-Install-CKAN-2.0-on-CentOS-6.3

My lack of familiarity with puppet (and correspondingly long lead in to actually getting
anything done) resulted in this project never being completed in the time frame available.

All the puppet script does is install the CKAN dependencies, and set up Postgres. I did
complete some further puppet scripts to install other components of CKAN, but ran into 
problems with the various puppet modules which are needed to do a lot of steps in the
installation.

Following the instructions at the above address, I did get an an installation of CKAN 2.0
working on a CentOS 6.3 VM without too many problems. 

I would not recommend puppet as a suitable installation mechanism for this software. It 
would be far easier to follow the instructions at the above address (using CentOS 6.3 if
possible). There would be some issues with performing updates on this software, but
anyone familiar with python and git would find this software relatively easy to maintain.
