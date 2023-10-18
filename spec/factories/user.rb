FactoryBot.define do
  factory :user do
    name { 'Sample User' }
    email { 'example@email.com' }
    password { 'password' }
    password_confirmation { 'password' } 
  end
end
