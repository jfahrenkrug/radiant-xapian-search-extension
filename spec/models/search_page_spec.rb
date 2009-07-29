require File.dirname(__FILE__) + '/../spec_helper'

describe SearchPage do  
  dataset :xapian_search_pages
  
  def test_search_form_works_for_regular_page
    @page = pages(:documentation)
    form = "<form action=\"/documentation\" method=\"get\" id=\"search_form\"><p><input type=\"text\" id=\"q\" name=\"q\" value=\"\" size=\"15\" alt=\"search\"/> <input value=\"Search\" type=\"submit\" /></p></form>\n"
    @page.should render('<r:search:form />').as(form)
  end
  
  def test_search_form_with_query
    @page = pages(:search)
    @page.query = 'test'
    form = "<form action=\"/search\" method=\"get\" id=\"search_form\"><p><input type=\"text\" id=\"q\" name=\"q\" value=\"test\" size=\"15\" alt=\"search\"/> <input value=\"Search\" type=\"submit\" /></p></form>\n"
    @page.should render('<r:search:form />').as(form)
  end  
  
  def test_search_form_with_url
    @page = pages(:search)
    form = "<form action=\"/other_url\" method=\"get\" id=\"search_form\"><p><input type=\"text\" id=\"q\" name=\"q\" value=\"\" size=\"15\" alt=\"search\"/> <input value=\"Search\" type=\"submit\" /></p></form>\n"
    @page.should render('<r:search:form url="/other_url" />').as(form)
  end
  
  def test_search_form_with_label
    @page = pages(:search)
    form = "<form action=\"/search\" method=\"get\" id=\"search_form\"><p><label for=\"q\">Search:</label> <input type=\"text\" id=\"q\" name=\"q\" value=\"\" size=\"15\" alt=\"search\"/> <input value=\"Search\" type=\"submit\" /></p></form>\n"
    @page.should render('<r:search:form label="Search:" />').as(form)
  end  
  
  def test_search_form_with_submit
    @page = pages(:search)
    form = "<form action=\"/search\" method=\"get\" id=\"search_form\"><p><input type=\"text\" id=\"q\" name=\"q\" value=\"\" size=\"15\" alt=\"search\"/> <input value=\"Go!\" type=\"submit\" /></p></form>\n"
    @page.should render('<r:search:form submit="Go!" />').as(form)
  end  
  
  def test_truncate_and_strip
    @page = pages(:search)
    @page.should render('<r:truncate_and_strip length="10">abcde fghij klmno</r:truncate_and_strip>').as('abcde f...')
  end  
  
  def test_highlight
    @page = pages(:search)
    @page.query = 'abc'
    @page.should render('<r:search:highlight>abcde fghij klmno</r:search:highlight>').as('<strong class="highlight">abc</strong>de fghij klmno')
  end
  
  def test_highlight_only_highlights_first_word
    @page = pages(:search)
    @page.query = 'cde fgh'
    @page.should render('<r:search:highlight>abcde fghij klmno</r:search:highlight>').as('ab<strong class="highlight">cde</strong> <strong class="highlight">fgh</strong>ij klmno')
  end
  
  def test_highlight_renders_truncated_content_if_content_does_not_match_query
    @page = pages(:search)
    @page.query = 'X'
    @page.should render('<r:search:highlight length="10">abcde fghij klmno</r:search:highlight>').as('abcde f...')
  end
  
  def test_highlight_with_uneven_length
    @page = pages(:search)
    @page.query = 'X'
    @page.should render('<r:search:highlight length="9">abcde fghij klmno</r:search:highlight>').as('abcde ...')
  end
  
  def test_highlight_with_small_length
    @page = pages(:search)
    @page.query = 'abc'
    @page.should render('<r:search:highlight length="9">abcde fghij klmno</r:search:highlight>').as('<strong class="highlight">abc</strong>de fgh...')
  end
end
