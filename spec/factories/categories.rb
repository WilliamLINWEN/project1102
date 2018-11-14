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

FactoryBot.define do
  factory :category do
    name { "MyString" }
    parent_id { 1 }
    position { 1 }
  end
end
