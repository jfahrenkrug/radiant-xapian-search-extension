class XapianSearchExtension < Radiant::Extension
  version "1.0"
  description "Search Pages with ActsAsXapian"
  url "http://springenwerk.com"
  
  def activate
    Page.send(:include, XapianSearch::PageExtensions)
    admin.page.edit.add :extended_metadata, "search_toggle"
  end
  
  def deactivate
  end
  
end