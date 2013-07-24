vcl-theme-fivecolleges
======================

A bootstrap-based theme for the [Apache VCL project](http://vcl.apache.org).


Instalation
-----------

To install this theme, move the files into the `themes` directory in the
VCL web root. Then, update the VCL database with the appropriate name of
your theme. For example, if the theme is titled `fivecolleges` and you
wish to update affiliations 1, 3 and 4, then use this command:

    UPDATE affiliation SET theme = 'fivecolleges' WHERE id IN (1, 3, 4);


Using LDAP
----------

If your VCL installation uses LDAP for user lookup, you may want to change
a few lines in the `css/fivecolleges.css` file. Because my setup does not
use LDAP, I explicitly conceal the "Attempt forcing an update from LDAP
(User ID only)" input control on the "User Lookup" page. Removing the
following lines will make that control appear:

    input#force {
            display:none;
    }
    input#force + label {
            display:none;
    }


Using Custom Connect Methods
----------------------------

The javascript code expects the "Connect Method" text to be in a particular
format in the database (i.e. in the `vcl.connectmethod` table). These templates
(i.e. `ssh.tpl` and `rdp.tpl`) are also included in the `templates` directory,
and they will need to be manually added to the database, though if they
are not added, nothing untoward will occur.


Customizing the CSS files
-------------------------

This theme uses [Twitter-Bootstrap](http://twitter.github.io/bootstrap/)
as a starting point for generating the main CSS files. The *.less files
are all included in case there are further changes desired. The CSS file
can be regenerated by issuing the following command

    $ recess --compress less/bootstrap.less > css/bootstrap.min.css

Recess is a node.js module, and it can be installed like so:

    $ npm install recess -g 

**Note**: you will need to have node.js and NPM installed

All icons are based on those provided by
[Font-Awesome](http://fortawesome.github.io/Font-Awesome/)

All of the template files are located in the `templates` directory, and
they follow the [Mustache](http://mustache.github.io) way of doing
things. You will at least want to modify the `footer.tpl` file.


