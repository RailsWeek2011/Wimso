class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  
    has_and_belongs_to_many :friends, 
                          :class_name => 'User', 
                          :foreign_key => 'user_id', 
                          :association_foreign_key => 'friend_id', 
                          :join_table => 'friends_users'
  belongs_to :series_db
  validates :name , :uniqueness => true, 
				:presence => true, 
				:format => { :with => /\A[a-zA-Z]+([0-9]*[a-zA-Z]*)*\z/,:message => "Only letters allowed" }
				:length => { :in => 3..20,
							:too_long => "%{count} characters is the maximum allowed",
							:too_short => "%{count} characters is the minimum allowed"}
  
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name

end
