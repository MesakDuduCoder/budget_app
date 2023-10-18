FactoryBot.define do
  factory :payment do
    name { 'Sample Payment' }
    amount { 100 }
    user
  end
end