Fabricator(:user) do
  username { Faker::Name.name }
  password '12345678'
  email { Faker::Internet.free_email }
  gender { %w(male female).sample }
  address { Faker::Address.city }
  numberphone { Faker::PhoneNumber.phone_number }
end