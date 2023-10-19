FactoryBot.define do
  factory :category do
    name { 'Sample Category' }
    icon { 'fa fa-star' }
    user
  end
end
