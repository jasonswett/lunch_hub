require 'spec_helper'

feature 'Visitor signs up to be notified of launch' do
  scenario 'with valid first name and email' do
    fill_form_with("Jason", "jason.swett@gmail.com")
    expect(page).to have_thank_you_content
  end

  scenario 'with non-unique email' do
    2.times { fill_form_with("Jason", "jason.swett@gmail.com") }
    expect(page).not_to have_thank_you_content
  end

  scenario 'with missing first name' do
    fill_form_with("", "jason.swett@gmail.com")
    expect(page).not_to have_thank_you_content
  end

  scenario 'with missing email' do
    fill_form_with("Jason", "")
    expect(page).not_to have_thank_you_content
  end

  def have_thank_you_content
    have_content("Thanks for signing up to be notified.")
  end

  def fill_form_with(first_name, email)
    visit root_path
    fill_in 'First name', with: first_name
    fill_in 'Email', with: email
    click_button 'Get Notified'
  end
end
