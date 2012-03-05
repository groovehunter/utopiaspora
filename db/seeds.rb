#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => citie

require File.join(File.dirname(__FILE__), "..", "config", "environment")
require 'factory_girl_rails'
require File.join(File.dirname(__FILE__), "..", "spec", "helper_methods")
include HelperMethods

#alice = Factory(:user_with_aspect, :username => "alice", :password => 'evankorth')
#bob   = Factory(:user_with_aspect, :username => "bob", :password => 'evankorth')
#eve   = Factory(:user_with_aspect, :username => "eve", :password => 'evankorth')
alice = Factory(:user, :username => "alice", :password => 'evankorth')
bob   = Factory(:user, :username => "bob", :password => 'evankorth')
eve   = Factory(:user, :username => "eve", :password => 'evankorth')

print "Creating seeded users... "
alice.person.profile.update_attributes(:first_name => "Alice", :last_name => "Smith",
  :image_url => "/images/user/uma.jpg",
  :image_url_small => "/images/user/uma.jpg",
  :image_url_medium => "/images/user/uma.jpg")
bob.person.profile.update_attributes(:first_name => "Bob", :last_name => "Grimm",
  :image_url => "/images/user/wolf.jpg",
  :image_url_small => "/images/user/wolf.jpg",
  :image_url_medium => "/images/user/wolf.jpg")
eve.person.profile.update_attributes(:first_name => "Eve", :last_name => "Doe",
  :image_url => "/images/user/angela.jpg",
  :image_url_small => "/images/user/angela.jpg",
  :image_url_medium => "/images/user/angela.jpg")
puts "done!"

puts "Successfully seeded the db with users eve, bob, and alice (password: 'evankorth')"
puts ""

