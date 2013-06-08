class Item < ActiveRecord::Base
  attr_accessible :completed, :description, :list_id, :title

  belongs_to :list
  scope :completed, where(:completed => true)
  scope :incomplete, where(:completed => false)
end
