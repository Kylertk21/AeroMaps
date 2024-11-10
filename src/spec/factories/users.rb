FactoryBot.define do
    factory :user do
        email { Faker::Internet.unique.email }
        password { "password" }
        password_confirmation { "password" }
    end
    trait :empty do
      email { "" }
      password { "" }
      password_confirmation { "" }
    end
    trait :invalidpw do 
      email { "test@example.com" }
      password { "password" }
      password_confirmation { "otherpassword" }
    end
end