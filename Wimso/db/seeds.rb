# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1=User.create :name => "eins", :email => "foo1@bar.gov", :password => "123456", :password_confirmation => "123456", :privacy_flag => false
u2=User.create :name => "zwei", :email => "foo2@bar.gov", :password => "123456", :password_confirmation => "123456", :privacy_flag => false
u3=User.create :name => "drei", :email => "foo3@bar.gov", :password => "123456", :password_confirmation => "123456", :privacy_flag => false

u1.friends << u2
u2.friends << u1

u1.save
u2.save

s1 = Serie.create :name => "Breaking Bad"
e1 = Episode.create :title => "Pilot"

s1.episodes << e1
s1.save

