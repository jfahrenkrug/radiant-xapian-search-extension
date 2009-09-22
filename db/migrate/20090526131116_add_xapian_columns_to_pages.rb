class AddXapianColumnsToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :searchable, :boolean, :default => true
    add_index  :pages, :searchable, :name => 'xapian_searchable'
  end

  def self.down
    remove_index  :pages, :name => 'xapian_searchable'
    remove_column :pages, :searchable
  end
end