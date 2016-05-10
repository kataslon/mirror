FactoryGirl.define do
  factory :opinion do
    description { Faker::Hipster.sentences(1) }
    rate 0
  end
end
