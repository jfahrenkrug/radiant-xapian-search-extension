class AddXapianColumnsToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :searchable, :boolean, :default => true
    add_index  :pages, :searchable
  end

  def self.down
    #remove_index  :pages, :searchable
    #remove_column :pages, :searchable
  end
end
