class List < ActiveRecord::Base
  attr_accessible :description, :title, :published, :tag_list

  scope :publish, where(:published => true)
  scope :private, where(:published => false)

  has_many :items
  belongs_to :user

  paginates_per 10

  has_many :taggings
  has_many :tags, through: :taggings

def self.tagged_with(name)
  Tag.find_by_name!(name).lists
end

def self.tag_counts
  Tag.select("tags.*, count(taggings.tag_id) as count").
    joins(:taggings).group("taggings.tag_id")
end

def tag_list
  tags.map(&:name).join(", ")
end

def tag_list=(names)
  self.tags = names.split(",").map do |n|
    Tag.where(name: n.strip).first_or_create!
  end
end

end
