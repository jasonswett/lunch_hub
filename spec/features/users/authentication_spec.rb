require 'rails_helper'

feature 'Authentication', js: true do
  before do
		@user = FactoryGirl.create(:confirmed_user)
    @login_page = LoginPage.new
    visit '/sign_in'
  end

  feature 'login' do
    scenario 'with valid inputs' do
      @login_page.sign_in(@user.email, @user.password)
      expect(page).to have_content('Sign out')
    end

    scenario 'with invalid credentials' do
      @login_page.sign_in('invalid@lol.com', 'not the actual password', wait_for_load: false)
      expect(page).to have_content('Invalid login credentials. Please try again.')
    end
  end

  feature 'logout' do
    before do
      @login_page.sign_in(@user.email, @user.password)
    end

    scenario 'without a refresh' do
      @login_page.sign_out
      expect(@login_page).to have_login_form
    end

    scenario 'with a refresh' do
      # Without this it doesn't seem to want to wait for the
      # whole page to load before moving onto the next thing.
      expect(page).to have_content('Sign out')

      visit '/'
      @login_page.sign_out
      expect(@login_page).to have_login_form
    end
  end

  feature 'redirect to today when logged in' do
    scenario 'after logging in' do
      @login_page.sign_in(@user.email, @user.password)
      visit '/'
      expect(page).to have_content("Today's Lunch")
    end

    scenario 'when not logged in' do
      visit '/'
      expect(page).not_to have_content("Today's Lunch")
    end
  end

  feature 'restricting page access' do
    scenario 'visiting "today" page when signed in' do
      @login_page.sign_in(@user.email, @user.password)
      visit '/today'
      expect(page).to have_content("Today's Lunch")
    end

    scenario 'visiting "today" page when not signed in' do
      visit '/today'
      expect(page).not_to have_content("Today's Lunch")
    end
  end
end
