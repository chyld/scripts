# encoding: utf-8

print 'Name of Project: '
project = gets.chomp

print '(1) Foundation, (2) Pure + Angular: '
option = gets.chomp.to_i

source = case option
   when 1 then '~/Code/Projects/Express-Template'
   when 2 then '~/Code/Projects/Node-Express-Pure-Angular-Mongo'
end

time = Time.now.strftime("%Y-%m-%d")
pwd = `pwd`.chomp

cmd0 = "cp -r #{source} #{pwd}/#{time}-#{project}"
cmd1 = "cd #{pwd}/#{time}-#{project}"
cmd2 = "rm -rf .git"

cmd3 = "#{cmd0} && #{cmd1} && #{cmd2}"
`#{cmd3}`

puts 'Your new project is ready!'
