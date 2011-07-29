class Run < ActiveRecord::Base
  has_many :comments
  has_many :episodes
  has_many :tag
  has_many :user_runs

  validates :name, :presence => true
  validates :anz_staf, :presence => true
  validates :anz_eps, :presence => true
end
