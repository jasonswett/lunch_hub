require 'spec_helper'

feature "Registration", js: true do
  before do
		@user = FactoryGirl.create(:confirmed_user)
    visit "/sign_up"
  end

  scenario "with valid inputs" do
    password = "mysupersecurepasswordlol"
    fill_in "Email", with: "jason@benfranklinlabs.com"
    fill_in "Password", with: password
    fill_in "Password confirmation", with: password
    click_on "Register"

    expect(page).to have_content("Sign out")
  end
end
