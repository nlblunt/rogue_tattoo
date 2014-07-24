# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :makeupartist do |f|
  	f.name {Faker::Name.name }
    f.bio {Faker::Lorem.paragraph }
  end
end
