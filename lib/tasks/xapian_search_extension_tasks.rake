namespace :radiant do
  namespace :extensions do
    namespace :xapian_search do
      
      desc "Runs the migration of the Xapian Search extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          XapianSearchExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          XapianSearchExtension.migrator.migrate
        end
      end

      desc "Copies public assets of the Xapian Search Extension to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from XapianSearchExtension"
        Dir[XapianSearchExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(XapianSearchExtension.root, '')
          directory = File.dirname(path)
          FileUtils.mkdir_p RAILS_ROOT + directory
          FileUtils.cp file, RAILS_ROOT + path
        end
      end
    end
  end
end

# Load any rakefiles of acts_as_xapian
Dir[File.join(File.dirname(__FILE__), %w{.. .. vendor plugins acts_as_xapian tasks *.rake})].sort.each { |f| import f }