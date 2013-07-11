# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :picture do
    album 
    url File.open(File.join(Rails.root, "/public/Test.jpg"))
  end
end
