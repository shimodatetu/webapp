class Smallcategory < ApplicationRecord
  belongs_to :bigcategory
  has_many :groups
  has_many :secretcategories
end
