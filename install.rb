#!/usr/bin/env ruby

puts "-------------------------------------------------------------------------"
puts "                             Begin OMNILOADER                            "
puts "-------------------------------------------------------------------------"

Dir.chdir
puts "Making setup directory (~/.omniloader_setup)..."
Dir.mkdir(".omniloader_setup") unless Dir.exists?(".omniloader_setup")
puts "done"
puts

`mv .vim .vim_copy`

puts "Copying .vimrc..."
vimrc_copy = File.exists?(".vimrc") ? File.read(".vimrc") : ""
Dir.chdir(".omniloader_setup")
File.open("vimrc_copy", "w") do |f|
  f.puts vimrc_copy
end
Dir.chdir
puts "done"
puts

puts "Copying .bashrc..."
bashrc_copy = File.exists?(".bashrc") ? File.read(".bashrc") : ""
Dir.chdir(".omniloader_setup")
File.open("bashrc_copy", "w") do |f|
  f.puts bashrc_copy
end
Dir.chdir
puts "done"
puts

puts "Installing Vundle..."
vundle = system(
  "git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle"
)
puts vundle ? "done" : "failed"

puts
puts "-------------------------------------------------------------------------"
puts "                              End OMNILOADER                             "
puts "-------------------------------------------------------------------------"
puts "ENJOY YOUR AWESOME TERMINAL"

