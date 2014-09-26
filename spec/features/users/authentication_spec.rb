require 'spec_helper'

feature "Authentication", js: true do
  before do
		@user = FactoryGirl.create(:confirmed_user)
    @login_page = LoginPage.new
    visit "/sign_in"
  end

  scenario "with valid inputs" do
    @login_page.sign_in(@user.email, @user.password)
    expect(page).to have_content("Sign out")
  end

  scenario "with invalid credentials" do
    @login_page.sign_in("invalid@lol.com", "not the actual password")
    expect(page).to have_content("Invalid login credentials. Please try again.")
  end

  scenario "redirection" do
    @login_page.sign_in(@user.email, @user.password)
    find("a", text: "Sign out").click

    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
  end
end
