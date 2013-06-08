# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    title "MyString"
    description "MyText"
    completed false
    list_id 1
  end
end
