puts `clear`
puts 'Watching haml files...'

watch('(.*?\.)haml$') do |path|
  cmd = "haml #{path[0]} #{path[1]}html"
  puts cmd

  begin
    `#{cmd}`
  rescue
  end
end
