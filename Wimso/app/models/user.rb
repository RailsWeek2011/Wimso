class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  
    has_and_belongs_to_many :friends, 
                          :class_name => 'User', 
                          :foreign_key => 'user_id', 
                          :association_foreign_key => 'friend_id', 
                          :join_table => 'friends_users'
  belongs_to :series_db
  
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name

end
