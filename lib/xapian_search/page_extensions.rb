module XapianSearch
  module PageExtensions
   
   def self.included(base)     
     base.xapit(:conditions => { :searchable => true, :status_id => 100 }) do |index|
           index.text :title, :weight => 10
           index.text :keywords, :weight => 10
           index.text :description, :weight => 8
           index.text :xapian_parts_content, :weight => 6
           
           index.field :xapian_site_base_domain
           index.field :xapian_site_name
           index.sortable :title
     end
   end
   
   # Returns the content of all parts as one string
   def xapian_parts_content
     parts.collect {|p| p.content }.join('\n') 
   end
   
   # Returns (if the "site" assoc is present) the page site's or the page parent site's base_domain
   def xapian_site_base_domain
     current_site = self.site_of_current_page
     return current_site.base_domain if current_site     
     return ''
   end
   
   # Returns (if the "site" assoc is present) the page site's or the page parent site's name
   def xapian_site_name
     current_site = self.site_of_current_page
     return current_site.name if current_site     
     return ''
   end
   
   private
   
   def site_of_current_page
     if respond_to?(:site)
       current_page = self

       while(current_page and !current_page.site)
         current_page = current_page.parent
       end

       if current_page and current_page.site
         return current_page.site
       end
     end
   end
    
  end
end