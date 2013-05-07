class Application < ActiveRecord::Base
  attr_accessible :abr, :title, :process
  
  validates :abr, presence: true
  validates :title, presence: true
end
