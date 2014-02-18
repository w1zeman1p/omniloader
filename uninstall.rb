#!/usr/bin/env ruby
#
puts "-------------------------------------------------------------------------"
puts "                             Begin OMNILOADER                            "
puts "-------------------------------------------------------------------------"

Dir.chdir
Dir.chdir(".omniloader_setup")

puts "Copying backup .vimrc..."
vimrc_copy = File.read("vimrc_copy")
puts "done"
puts

puts "Copying backup .bashrc..."
bashrc_copy = File.read("bashrc_copy")
puts "done"
puts

Dir.chdir
puts "Deleting .vim directrory..."
vim_dir = system("rm -rf .vim")
puts vim_dir ? "done" : "failed"
puts

puts "Reverting to old .vimrc..."
File.open("vimrc", "w") do |f|
  f.puts vimrc_copy
end
`mv vimrc .vimrc`
puts "done"
puts

puts "Reverting to old .bashrc..."
File.open(".bashrc", "w") do |f|
  f.puts bashrc_copy
end
puts "done"
puts

puts "Removing setup directory..."
remove = system("rm -rf .omniloader_setup")
puts remove ? "done" : "failed"
puts

Dir.chdir
`mv .vim_copy .vim`

puts "-------------------------------------------------------------------------"
puts "                              End OMNILOADER                             "
puts "-------------------------------------------------------------------------"
puts "ENJOY BEING VANILLA AND BORING"
