class Comment < ActiveRecord::Base
  has_and_belongs_to_many :run
  belongs_to :user
  
  validates :content, :length => { :in => 10..500 }
end
