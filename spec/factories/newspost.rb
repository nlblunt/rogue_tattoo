require 'faker'

FactoryGirl.define do
  factory :newspost do |f|
    f.heading {Faker::Lorem.sentence}
    f.body {Faker::Lorem.paragraph}
    f.start_date Date.yesterday
    f.end_date Date.tomorrow
  end
end
