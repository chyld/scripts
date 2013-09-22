require 'listen'

directory = Dir.pwd
puts `clear`
puts "Watching the #{directory} directory for HAML additions or modifications..."

listener = Listen.to(directory) do |modified, added, removed|
  (modified + added).each do |file|

    # strip the filename from the full pathname
    # do not convert partial haml files
    local = File.basename(file)
    if /^[^_].*haml/.match(local)
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
