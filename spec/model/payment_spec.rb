require 'rails_helper'

RSpec.describe Payment, type: :model do
  it "Payment is valid" do
    user = User.new(name: 'Sample User', email: 'exampleemail.com', password: 'password')
    payment = Payment.new(name: 'Sample Payment', amount: 100, user: user)
    expect(payment).to be_valid
  end

  it "Amount is negative" do
    user = User.new(name: 'Sample User', email: 'exampleemail.com', password: 'password')
    payment = Payment.new(name: 'Sample Payment', amount: -100, user: user)
    expect(payment).to_not be_valid
  end

  it "Payment is invalid without name" do
    user = User.new(name: 'Sample User', email: 'exampleemail.com', password: 'password')
    payment = Payment.new(name: '', amount: 100, user: user)
    expect(payment).to_not be_valid
  end
end
