module XapianSearch
  module PageExtensions
   
   def self.included(base)     
     base.xapit(:conditions => { :searchable => true }) do |index|
           index.text :title, :weight => 10
           index.text :xapian_parts_content
     end
   end
   
   # Returns the content of all parts as one string
   def xapian_parts_content
     parts.collect {|p| p.content }.join('\n') 
   end
    
  end
end