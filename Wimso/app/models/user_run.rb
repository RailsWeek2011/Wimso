class UserRun < ActiveRecord::Base
  
  belongs_to :comments
  belongs_to :user
  belongs_to :run
end
