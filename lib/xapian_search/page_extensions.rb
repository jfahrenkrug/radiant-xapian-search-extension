module XapianSearch
  module PageExtensions
   
   def self.included(base)
     #base.acts_as_xapian :texts => [ :title, :xapian_parts_content ], :values => [ [ :updated_at, 0, "updated_at", :date ] ], :if => :searchable
     
     base.xapit do |index|
           index.text :title, :xapian_parts_content
     end
     
     
     #base.define_index do
    #   set_property :delta => true, :group_concat_max_len => 8.kilobytes
    #   set_property :field_weights => { 'title' => 100 }
    #   indexes title, parts.content
    #   has updated_at, status_id, searchable
    #   where 'searchable = 1'
    # end
   end
   
   # Returns the content of all parts as one string
   def xapian_parts_content
     parts.collect {|p| p.content }.join('\n') 
   end
    
  end
end