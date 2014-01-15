#!/usr/bin/env ruby
# require_relative "homebrew_install"
# require_relative "test_script"

puts "-------------------------------------------------------------------------"
puts "                             Begin OMNILOADER                            "
puts "-------------------------------------------------------------------------"

PATH = File.expand_path(File.dirname(__FILE__))

Dir.chdir
print "Making setup directory..."
Dir.mkdir("omniloader_setup") unless Dir.exists?("omniloader_setup")
print "done\n"

print "Copying .vimrc..."
vimrc_copy = File.exists?(".vimrc") ? File.read(".vimrc") : ""
Dir.chdir("omniloader_setup")
File.open("vimrc_copy", "w") do |f|
  f.puts vimrc_copy
end
Dir.chdir
print "done\n"

print "Copying .bashrc..."
bashrc_copy = File.exists?(".bashrc") ? File.read(".bashrc") : ""
Dir.chdir("omniloader_setup")
File.open("bashrc_copy", "w") do |f|
  f.puts bashrc_copy
end
Dir.chdir
print "done\n"

print "Installing homebrew..."
Dir.chdir()
Dir.chdir("omniloader_setup")
Dir.mkdir("homebrew")
hb = system("curl -L https://github.com/Homebrew/homebrew/tarball/master | tar xz --strip 1 -C homebrew")
print hb ? "done" : "failed"
print "\n"

print "Installing ack..."
ack = false#system("brew install ack")
print ack ? "done" : "failed"
print "\n"

print "Installing fish..."
fish = false#system("brew install fish")
print fish ? "done" : "failed"
print "\n"

print "Installing Janus..."
janus = false#system("curl -Lo- https://bit.ly/janus-bootstrap | bash")
print janus ? "done" : "failed"
print "\n"

print "Applying your .vimrc..."
Dir.chdir(PATH)
Dir.chdir("master_settings")
vimrc_master = File.read(".vimrc")
Dir.chdir
File.open(".vimrc.after", "w") do |f|
  f.puts vimrc_master
end
print "done\n"

print "Applying your .bashrc..."
Dir.chdir(PATH)
Dir.chdir("master_settings")
bashrc_master = File.read(".vimrc")
Dir.chdir
File.open(".bashrc", "w") do |f|
  f.puts bashrc_master
end
print "done\n"
