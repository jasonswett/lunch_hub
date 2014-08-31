require 'spec_helper'

feature "Sign in", js: true do
  scenario "with valid inputs" do
		user = FactoryGirl.create(:confirmed_user)

    visit "/#/sign_in"
    fill_in "email", with: user.email
    fill_in "password", with: user.password
    find("button", text: "Sign in").click

		expect(page).to have_content("This is the home page.")
  end
end
