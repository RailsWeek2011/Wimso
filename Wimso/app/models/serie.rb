class Serie < ActiveRecord::Base
  has_many :comments
  has_many :episodes
end
