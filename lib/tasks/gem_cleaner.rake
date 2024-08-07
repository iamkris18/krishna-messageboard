namespace :gem_cleaner do
    desc "Find unused gems"
    task find_unused_gems: :environment do
      required_gems = []
      Dir.glob('**/*.rb').each do |file|
        File.read(file).scan(/require\s+'(\S+)'/).each do |match|
          required_gems << match.first
        end
      end
  
      installed_gems = `gem list`.scan(/^(\S+)\s+\((\S+)\)/).map(&:first)
      unused_gems = installed_gems - required_gems
  
      puts "Unused gems:"
      unused_gems.each { |gem| puts gem }
    end
  end
  