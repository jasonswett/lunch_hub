require 'spec_helper'

feature "Add a group", js: true do
  scenario "with valid inputs" do
		@user = FactoryGirl.create(:confirmed_user)
    @login_page = LoginPage.new
    @login_page.visit
    @login_page.sign_in(@user.email, @user.password)
    expect(page).to have_content("Today's Lunch")

    visit "/groups"
    group_name = "Ben Franklin Labs"
    fill_in "group-name", with: group_name
    click_on "Save Group"
    expect(page).to have_content(group_name)
  end
end
