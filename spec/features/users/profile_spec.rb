require 'rails_helper'

feature 'Profile', js: true do
  before do
		@user = FactoryGirl.create(:confirmed_user)
    login_page = LoginPage.new
    login_page.visit
    login_page.sign_in(@user.email, @user.password)
    
    @profile_page = ProfilePage.new
    @profile_page.visit
  end

  it 'shows an update message' do
    @profile_page.complete_form(name: 'Jason')
    expect(@profile_page).to have_success_message
  end

  it 'saves the new name' do
    new_name = 'Jason'
    @profile_page.complete_form(name: new_name)
    expect(@profile_page).to have_success_message

    @profile_page.visit
    expect(page).to have_field('name', with: new_name)
  end

  it 'has a place to select groups' do
    group = FactoryGirl.create(:group)
    @profile_page.visit
    check "group-#{group.id}"
    click_on 'Save'

    @profile_page.visit
    expect(find("#group-#{group.id}")).to be_checked
  end
end
