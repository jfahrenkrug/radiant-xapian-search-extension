Xapian Search
===

Adds [ActsAsXapian](http://github.com/Overbryd/acts_as_xapian/tree/master) support to Radiant.

Installation
---

First you need to install [Xapian](http://www.locomotivation.com/blog/2008/07/23/simple-ruby-on-rails-full-text-search-using-xapian.html).
Once that's done, install the extension:

    cd /path/to/radiant
    git clone git://github.com/jfahrenkrug/radiant-xapian-search-extension.git vendor/extensions/xapian_search

After installation, you'll need to load the ActsAsXapian submodule via:

    cd vendor/extensions/xapian_search
    git submodule init
    git submodule update
    cd /path/to/radiant

Then you'll need to run the migrations:

    rake radiant:extensions:xapian_search:migrate RAILS_ENV=development

And finally you'll have to create the index:

    rake xapian:rebuild_index models="Page" RAILS_ENV=development

That's it! You can try it out with this command:

    rake xapian:query models="Page" query="the" RAILS_ENV=development

Please note that the index will NOT be updated automatically! You'll have to run 

    rake xapian:update_index
    
or

    rake xapian:rebuild_index models="Page" RAILS_ENV=development

regularly to keep the index up to date. Setting up a cron job might be a good idea.
For more info, check the [ActsAsXapian README](http://github.com/Overbryd/acts_as_xapian/tree/master) or [this post](http://www.locomotivation.com/blog/2008/07/23/simple-ruby-on-rails-full-text-search-using-xapian.html)

Based on the sphinx_search_extension by Digital Pulp.
ActsAsXapian port by Johannes Fahrenkrug, [Springenwerk](http://springenwerk.com)

==============================================================================

Copyright (c) 2008 Digital Pulp, Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.