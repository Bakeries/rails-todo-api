FactoryBot.define do
  factory :user do
    username { Faker::Internet.username }
    password 'foobar'
  end
end
