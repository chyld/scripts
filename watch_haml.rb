watch('(.*?\.)haml$') do |path|
  cmd = "haml #{path[0]} #{path[1]}html"
  `#{cmd}`
  puts cmd
end
