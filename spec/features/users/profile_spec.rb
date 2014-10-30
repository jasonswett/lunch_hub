require 'spec_helper'

feature 'Profile', js: true do
  before do
		@user = FactoryGirl.create(:confirmed_user)
    login_page = LoginPage.new
    login_page.visit
    login_page.sign_in(@user.email, @user.password)
    visit '/profile'
  end

  it 'shows an update message' do
    fill_in 'name', with: 'Jason'
    click_on 'Save'
    expect(page).to have_content('Your profile has been updated.')
  end
end
