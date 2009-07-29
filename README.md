Xapian Search Extension for Radiant
===

Adds [Xapit](http://github.com/ryanb/xapit/tree/master) support to [Radiant](http://radiantcms.org).

Installation
---

First, you'll need to [install Xapian](http://wiki.github.com/Overbryd/acts_as_xapian/installation).

Next - from the root of your Radiant app - install the Xapit Plugin:

    git submodule add git://github.com/ryanb/xapit.git vendor/plugins/xapit
    mkdir config/initializers
    cp vendor/plugins/xapit/rails_generators/xapit/templates/setup_xapit.rb config/initializers
  
Finally, install the extension:

    git submodule add git://github.com/jfahrenkrug/radiant-xapian-search-extension.git vendor/extensions/xapian_search
    
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

Page Type and Tags
---

This extension should work as a drop-in replacement for the [Radiant Search Extension](http://github.com/radiant/radiant-search-extension/tree). So the instructions below and 99% of the search_page.rb code come from that extension. Thank you, guys!

### Installation:

This extension works by creating a new page type called "Search".  After you 
install it and re-start your web server, you should have a new type of page 
available.

1. Download and install according to the instructions above.
2. Create a new page called "Search" (or whatever you want)
3. Set the Page Type to "Search" and the Status to "Published"
4. Take the sample code below and paste it into the body of the new page.
5. Visit http://localhost:3000/search and enter a search term.
6. Bask in the glow of a job well done.  :)

### Example:

Place everything in the block below in the body of the "Search" page.  This 
will provide a very basic Search page, but it should show you everything you
need to know to make your own page better.


    <r:search:form submit="Search"/>

    <r:search:initial>
      <strong>Enter a phrase above to search this website.</strong>
    </r:search:initial>

    <r:search:empty>
      <strong>I couldn't find anything named "<r:search:query/>".</strong>
    </r:search:empty>

    <r:search:results>
      Found the following pages that contain "<r:search:query/>".

      <ul>
      <r:search:results:each>
      <li><r:link/><br/>
          <r:search:highlight><r:content/></r:search:highlight></li>
      </r:search:results:each>
      </ul>
    </r:search:results>



Inspired by the sphinx_search_extension by Digital Pulp.

In 2009 by Johannes Fahrenkrug, [Springenwerk](http://springenwerk.com)

