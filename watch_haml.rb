require 'listen'

directory = Dir.pwd
puts `clear`
puts "Watching the #{directory} directory for HAML additions or modifications..."

listener = Listen.to(directory) do |modified, added, removed|
  (modified + added).each do |file|

    if /haml$/.match(file)
      cmd = "haml #{file} #{file.gsub(/haml$/, 'html')}"
      puts "#{Time.now.strftime("%H:%M:%S")}: #{cmd}"

      begin
        `#{cmd}`
      rescue
      end
    end

  end
end

listener.run
sleep
