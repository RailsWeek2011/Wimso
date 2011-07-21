class User < ActiveRecord::Base
  has_and_belongs_to_many :friends, 
                          :class_name => 'User', 
                          :foreign_key => 'user_id', 
                          :association_foreign_key => 'friend_id', 
                          :join_table => 'friends_users'

  belongs_to :series_db
end
