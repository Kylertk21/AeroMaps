FactoryBot.define do
    factory :pilot_profile do 
      first_name { "testfirst" }
      last_name { "testlast" }
      aircraft_ident { "ABC-5432" }
      aircraft_type { "Cessna Skyhawk" }
      home_address { "12345 Test Ln, Test City, CO, 80208" }
      phone_number { 123456789 }
      bio { "Test, Test, Test, Test" }
      association :user, factory: :user
    end
  
    trait :emptyprofile do 
      first_name { "" }
      last_name { "" }
      aircraft_ident { "" }
      aircraft_type { "" }
      home_address { "" }
      phone_number { }
      bio { "" }
    end
  end