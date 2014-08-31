require 'spec_helper'

feature "Sign in", js: true do
  before do
		@user = FactoryGirl.create(:confirmed_user)
    visit "/#/sign_in"
  end

  scenario "with valid inputs" do
    fill_in "email", with: @user.email
    fill_in "password", with: @user.password
    find("button", text: "Sign in").click

		expect(page).to have_content("This is the home page.")
  end

  scenario "with invalid credentials" do
    fill_in "email", with: "invalid@lol.com"
    fill_in "password", with: "not the actual password"
    find("button", text: "Sign in").click

    expect(page).to have_content("Invalid login credentials. Please try again.")
  end
end
