FactoryBot.define do
  factory :category do
    name { "MyString" }
    parent_id { 1 }
    position { 1 }
  end
end
