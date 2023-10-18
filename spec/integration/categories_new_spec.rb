require 'rails_helper'

RSpec.feature 'New Category Page', type: :feature do
  before do
    @user = create(:user, name: 'John Doe', email: 'johndoe@email.com', password: 'password',
                          password_confirmation: 'password')
    sign_in(@user)
    visit new_category_path
  end

  scenario 'Displays options to add a new category' do
    expect(page).to have_content('New Category')
    expect(page).to have_content('Name')
    expect(page).to have_content('Icon')
    expect(page).to have_button('Create Category')

    fill_in 'Name', with: 'Category 3'
    select 'Drink', from: 'category_icon'

    click_button 'Create Category'

    expect(page).to have_content('Category 3 $0.00')
    expect(page).to have_css('i.bi.bi-beer')
    expect(page).to have_current_path(categories_path)
  end
end
