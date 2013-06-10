class List < ActiveRecord::Base
  attr_accessible :description, :title, :published

  validates :title, :presence => true

  scope :publish, where(:published => true)
  scope :private, where(:published => false)

  has_many :items
  belongs_to :user

  paginates_per 10

end
