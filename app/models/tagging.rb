class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :list
  # attr_accessible :title, :body
end
