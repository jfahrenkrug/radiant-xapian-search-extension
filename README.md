Xapian Search Extension for Radiant
===

Adds [Xapit](http://github.com/ryanb/xapit/tree/master) support to [Radiant](http://radiantcms.org).

Installation
---

First, you'll need to [install Xapian](http://wiki.github.com/Overbryd/acts_as_xapian/installation).

Next - from the root of your Radiant app - install the Xapit Plugin:

    script/plugin install git://github.com/ryanb/xapit.git
  
Finally, install the extension:

    script/extension install git://github.com/jfahrenkrug/xapian_search.git
    
And run the migration:

    rake radiant:extensions:xapian_search:migrate

Usage
---

Now you can call the search method on the Page class:

    Page.search("Yak Shaving")
    
It has built-in pagination. For more details and options, see the [Xapit Readme](http://github.com/ryanb/xapit/tree/master). 

The extension adds a "Searchable" checkbox to the Page admin form so you can define whether a page gets added to the index or not. Please note that the index is not being updated automatically!
You'll have to call 

    rake xapit:index
  
from a cron job regularly or use something like [Xapit-Sync](http://github.com/ryanb/xapit-sync/tree/master).


Inspired by the sphinx_search_extension by Digital Pulp.

In 2009 by Johannes Fahrenkrug, [Springenwerk](http://springenwerk.com)

