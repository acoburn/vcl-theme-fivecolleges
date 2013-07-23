vcl-theme-fivecolleges
======================

A bootstrap-based theme for the [Apache VCL project](http://vcl.apache.org).

This theme uses [Twitter-Bootstrap](http://twitter.github.io/bootstrap/)
as a starting point for generating the main CSS files. The *.less files
are all included in case there are further changes desired. The CSS file
can be regenerated by issuing the following command

    $ recess --compress less/bootstrap.less > css/bootstrap.min.css

Recess is a node.js module, and it can be installed like so:

    $ npm install recess -g 

Note: you will need to have node.js and NPM installed

All icons are based on those provided by
[Font-Awesome](http://fortawesome.github.io/Font-Awesome/)

All of the template files are located in the 'templates' directory, and
they follow the [Mustache](http://mustache.github.io) way of doing
things.

The javascript code expects the "Connect Method" text to be in a particular
format in the database (i.e. in the vcl.connectmethod table). These templates
(i.e. ssh.tpl and rdp.tpl) are also included in the 'templates' directory,
and they will need to be manually added to the database, though if they
are not added, nothing untoward will occur.

