require 'rails_helper'

RSpec.describe User, type: :model do
  it 'user is valid' do
    user = User.new(name: 'Sample User', email: 'example@email.com', password: 'password')
    expect(user).to be_valid
  end

  it 'user has wrong email format' do
    user = User.new(name: 'Sample User', email: 'exampleemail.com', password: 'password')
    expect(user).to_not be_valid
  end

  it 'user has dublicate email' do
    user = User.new(name: 'Sample User', email: 'exampleemail.com', password: 'password')
    expect(user).to_not be_valid
  end

  it 'user has weak password' do
    user = User.new(name: 'Sample User', email: 'exampleemail.com', password: 'pass')
    expect(user).to_not be_valid
  end
end
