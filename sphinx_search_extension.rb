class SphinxSearchExtension < Radiant::Extension
  version "1.0"
  description "Search Pages with ThinkingSphinx"
  url "https://code.digitalpulp.com"
  
  def activate
    Page.send(:include, SphinxSearch::PageExtensions)
    admin.page.edit.add :extended_metadata, "search_toggle"
  end
  
  def deactivate
  end
  
end