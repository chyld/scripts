print 'What project do you want to deploy (e.g., 2013-10-14-Vacation-Map)? '
dir = gets.chomp

full_dir = '~/Code/NSS-FrontEnd/' + dir
cmd = "cp -r #{full_dir} ~/Code/Projects"

puts cmd
`#{cmd}`
puts 'Your project is ready!'
