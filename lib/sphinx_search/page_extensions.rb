module SphinxSearch
  module PageExtensions
   
   def self.included(base)
     base.define_index do
       set_property :delta => true, :group_concat_max_len => 8.kilobytes
       set_property :field_weights => { 'title' => 100 }
       indexes title, parts.text_content
       has updated_at, status_id, searchable, lft, rgt
       where 'searchable = 1'
     end
   end
    
  end
end