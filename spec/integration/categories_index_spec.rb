require 'rails_helper'

RSpec.feature 'Categories Page', type: :feature do
  before do
    @user = create(:user, name: 'John Doe', email: 'johndoe@email.com', password: 'password',
                          password_confirmation: 'password')
    sign_in(@user)
    @payment3 = create(:payment, name: 'Payment for category 2', user: @user)
    @category1 = create(:category, name: 'Category 1', icon: 'fa fa-star', user: @user)
    @category2 = create(:category, name: 'Category 2', icon: 'fa fa-heart', user: @user)
    @category1.payments << create(:payment, name: 'Payment for category 1', amount: 100, user: @user)
    @category1.payments << create(:payment, name: 'Payment for category 1', amount: 200, user: @user)
    @category2.payments << create(:payment, name: 'Payment for category 2', amount: 50, user: @user)

    visit categories_path
  end

  scenario 'Displays the list of categories' do
    expect(page).to have_content('Categories')

    expect(page).to have_content('Category 1 $300')
    expect(page).to have_content('Category 2 $50')

    expect(page).to have_css('i.fa.fa-star', count: 1)
    expect(page).to have_css('i.fa.fa-heart', count: 1)
    click_link 'New Category'
    expect(page).to have_current_path(new_category_path)
  end
end
