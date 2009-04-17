namespace :radiant do
  namespace :extensions do
    namespace :sphinx_search do
      
      desc "Runs the migration of the Sphinx Search extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          SphinxSearchExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          SphinxSearchExtension.migrator.migrate
        end
      end
      
      desc "Turns off indexing for subsequent tasks"
      task :disable_deltas do
        ThinkingSphinx.deltas_enabled = false
      end

      desc "Copies public assets of the Sphinx Search to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from SphinxSearchExtension"
        Dir[SphinxSearchExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(SphinxSearchExtension.root, '')
          directory = File.dirname(path)
          FileUtils.mkdir_p RAILS_ROOT + directory
          FileUtils.cp file, RAILS_ROOT + path
        end
      end
    end
  end
end

require File.join(File.dirname(__FILE__), %w{.. .. vendor plugins thinking-sphinx lib thinking_sphinx tasks})