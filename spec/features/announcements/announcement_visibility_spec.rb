require 'rails_helper'

feature "Announcement", js: true do
  scenario "someone who's not a member of any of my groups makes an announcement" do
    # We don't share any groups with this other user's
    # announcement, so we should not see his announcement.
    other_user_announcement = FactoryGirl.create(:announcement)

		@user = FactoryGirl.create(:confirmed_user)
    @login_page = LoginPage.new
    @login_page.visit
    @login_page.sign_in(@user.email, @user.password)
    visit '/today'

    expect(page).not_to have_content(other_user_announcement.restaurant_name)
  end

  scenario "someone from one of my groups makes an announcement" do
    group = FactoryGirl.create(:group)

    other_user = FactoryGirl.create(:confirmed_user)
    FactoryGirl.create(:group_membership, group: group, user: other_user)
    other_user_announcement = FactoryGirl.create(:announcement, user: other_user)

		@user = FactoryGirl.create(:confirmed_user)
    FactoryGirl.create(:group_membership, group: group, user: @user)

    @login_page = LoginPage.new
    @login_page.visit
    @login_page.sign_in(@user.email, @user.password)
    visit '/today'

    expect(page).to have_content(other_user_announcement.restaurant_name)
  end
end
