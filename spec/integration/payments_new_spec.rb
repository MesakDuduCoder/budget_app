require 'rails_helper'

RSpec.feature "New Payment Page", type: :feature do
  before do
    @user = create(:user, name: 'John Doe', email: 'johndoe@email.com', password: 'password', password_confirmation: 'password')
    @category1 = create(:category, name: 'Category 1', icon: 'fa fa-star', user: @user)
    sign_in(@user)
    visit new_category_payment_path(@category1)
  end

  scenario "Displays options to add a new payment" do
    current_date = Time.now.strftime("%B %d, %Y")
    expect(page).to have_content("New Payment")
    expect(page).to have_content("Name")
    expect(page).to have_content("Amount")
    expect(page).to have_button("Create Payment")
    fill_in "Name", with: "Payment for category 1"
    fill_in "Amount", with: 100
    select "Category 1", from: "Category"

    click_button "Create Payment"

    expect(page).to have_content("Payment for category 1 #{current_date} $100.00")
    expect(page).to have_current_path(category_payments_path(@category1))
  end
end
