# == Schema Information
#
# Table name: categories
#
#  id         :bigint(8)        not null, primary key
#  name       :string           not null
#  parent_id  :integer
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
  has_many :children, class_name: 'Category', foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Category', required: false

  scope :main_categories, -> { where(parent_id: nil) }
  scope :sub_categories, -> { where.not(parent_id: nil) }
end
