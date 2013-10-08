# encoding: utf-8

require 'pry'

print 'Name of Project: '

project = gets.chomp
source = '~/Code/Projects/Foundation-FrontEnd-QUnit-Template'
time = Time.now.strftime("%Y-%m-%d")
pwd = `pwd`.chomp

cmd0 = "cp -r #{source} #{pwd}/#{time}-#{project}"
cmd1 = "cd #{pwd}/#{time}-#{project}"
cmd2 = "rm -rf .git*"

cmd3 = "#{cmd0} && #{cmd1} && #{cmd2}"
`#{cmd3}`

puts 'Your new project is ready!'
