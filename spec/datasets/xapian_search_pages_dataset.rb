class XapianSearchPagesDataset < Dataset::Base
  def load
    create_record :page, :homepage, 
      :id => 1, 
      :title => 'Ruby Home Page',
      :breadcrumb => 'Home',
      :slug => '/',
      :status_id => 100,
      :published_at => '2008-01-01 08:00:00'
      
    create_record :page, :documentation,
      :id => 2,
      :title => 'Documentation',
      :breadcrumb => 'Documentation',
      :slug => 'documentation',
      :status_id => 100,
      :parent_id => 1,
      :published_at => '2008-01-01 08:00:00'
    
    create_record :page, :search,
      :id => 3,
      :title => 'Search',
      :breadcrumb => 'search',
      :slug => 'search',
      :class_name => 'SearchPage',
      :status_id => 100,
      :parent_id => 1,
      :published_at => '2008-01-01 08:00:00'
    
  end
end