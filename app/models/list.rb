class List < ActiveRecord::Base
  attr_accessible :description, :title

  validates :title, :presence => true

  has_many :items
  belongs_to :user
  
end
