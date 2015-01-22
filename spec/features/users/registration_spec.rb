require 'rails_helper'

feature 'Registration', js: true do
  let(:email) { Faker::Internet.email }

  before do
    @registration_page = RegistrationPage.new
    @registration_page.visit
  end

  feature 'with valid inputs' do
    let(:password) { Faker::Internet.password }
    before { @registration_page.complete_form(email: email, password: password) }

    scenario 'account creation' do
      find('a', text: 'Sign out').click
      login_page = LoginPage.new
      login_page.visit
      login_page.sign_in(email, password)
      expect(page).to have_content('Sign out')
    end

    scenario 'sign-in upon account creation' do
      expect(page).to have_content('Sign out')
    end
  end

  scenario 'with a too-short password' do
    @registration_page.complete_form(email: email, password: 'a')
    expect(page).to have_content('Password is too short')
  end
end
