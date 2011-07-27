# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1=User.create :name => "eins", :email => "garbagegarbage@web.de", :password => "123456", :password_confirmation => "123456", :privacy_flag => false
u2=User.create :name => "zwei", :email => "foo2@bar.gov", :password => "123456", :password_confirmation => "123456", :privacy_flag => false
u3=User.create :name => "drei", :email => "foo3@bar.gov", :password => "123456", :password_confirmation => "123456", :privacy_flag => false
u4=User.create :name => "Okarin", :email => "jens.mehler@mni.th-mittelessen.de", :password => "gelbanane", :password_confirmation => "gelbanane"
u4.friends << u1
u1.friends << u4
u1.friends << u2
u2.friends << u1
u1.is_admin=true
u4.is_admin=true
u4.privacy_flag=false
u1.privacy_flag=true

u1.save
u2.save
u4.save 


s1 = Run.create :name => "Breaking Bad", :anz_staf => 5, :anz_eps => 64, :rating => 0, :anz_rating => 0, :global => true
e1 = Episode.create :title => "Pilot", :nr => 1
t1 = Tag.create :name => "drugs"
t2 = Tag.create :name => "drama"
t3 = Tag.create :name => "against the DEA"
s1.tag << t1
s1.tag << t2
s1.tag << t3

s1.episodes << e1

chat = Run.create :name => "Chat", :anz_staf => 0, :anz_eps => 0, :rating => 0, :anz_rating => 0, :global => false
c2 = Comment.create :content => "Chat"
chat.comments << c2
c2.user= u4
c2.save 
chat.save

c1 = Comment.create :content => "Great show with Bryan Cranston!"
c1.user= u4
s1.comments << c1
c1.save
s1.save




