require 'faker'

FactoryGirl.define do
  factory :makeupartist do |f|
  	f.name {Faker::Name.name }
    f.bio {Faker::Lorem.paragraph }
  end
end
