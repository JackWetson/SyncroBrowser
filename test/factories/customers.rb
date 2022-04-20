FactoryBot.define do
  factory :customer do
    association :team
    syncro_id { 1 }
    firstname { "MyString" }
    lastname { "MyString" }
    businessname { "MyString" }
    email { "MyString" }
    phone { "MyString" }
    mobile { "MyString" }
    created { "2022-04-20 14:13:05" }
    updated { "2022-04-20 14:13:05" }
    pdf_url { "MyString" }
    address { "MyString" }
    address_2 { "MyString" }
    city { "MyString" }
    state { "MyString" }
    zip { "MyString" }
    latitude { 1.5 }
    longitude { 1.5 }
    notes { "MyString" }
    get_sms { false }
    opt_out { false }
    disabled { false }
    no_email { false }
    business_and_full_name { "MyString" }
    business_then_name { "MyString" }
  end
end
