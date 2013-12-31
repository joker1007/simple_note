# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :note do
    title "MyString"
    raw_body "MyText"
    body "MyText"
  end
end
