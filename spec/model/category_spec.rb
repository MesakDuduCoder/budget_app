require 'rails_helper'

RSpec.describe Category, type: :model do
  it "Category is valid" do
    user = User.new(name: 'Sample User', email: 'exampleemail.com', password: 'password')
    category = Category.new(name: 'Sample Category', icon: 'icon', user: user)
    expect(category).to be_valid
  end

  it "Category is invalid without name" do
    user = User.new(name: 'Sample User', email: 'exampleemail.com', password: 'password')
    category = Category.new(name: '', icon: 'icon', user: user)
    expect(category).to_not be_valid
  end

  it "Category is invalid without icon" do
    user = User.new(name: 'Sample User', email: 'exampleemail.com', password: 'password')
    category = Category.new(name: 'Sample Category', icon: '', user: user)
    expect(category).to_not be_valid
  end
end
