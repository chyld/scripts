require 'listen'

directory = Dir.pwd
puts `clear`
puts "Watching the #{directory} directory for changes"

listener = Listen.to(directory) do |modified, added, removed|
  (modified + added).each do |file|

    # strip the filename from the full pathname
    # do not convert partial haml files
    local = File.basename(file)

    # convert regular haml file to html
    if /^[^_].*haml/.match(local)
      cmd = "haml #{file} #{file.gsub(/haml$/, 'html')}"
      puts "#{Time.now.strftime("%H:%M:%S")}: #{cmd}"
      begin
        `#{cmd}`
      rescue
      end
    end

    # if a haml partial is modified, cause it's parent to re-compile
    if /^_.*haml/.match(local)
      cmd = "grep -ril #{local} #{directory}"
      files = `#{cmd}`.split
      files.each do |f|
        cmd = "touch #{f}"
        puts "#{Time.now.strftime("%H:%M:%S")}: #{cmd}"
        begin
          `#{cmd}`
        rescue
        end
      end
    end
  end
end

listener.run
sleep
