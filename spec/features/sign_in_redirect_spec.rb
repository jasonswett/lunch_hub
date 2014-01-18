require 'spec_helper'

feature 'User gets shown the correct initial page' do
  scenario 'which when not signed in is the launch notification page' do
    visit "/"

    expect(page).to have_content('Get notified of launch')
  end

  scenario 'which when signed in is the groups page' do
    sign_in
    visit "/"

    expect(page).not_to have_content('Get notified of launch')
  end
end
