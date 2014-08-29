require 'spec_helper'

feature "Revoke admin privileges", js: true do
  scenario "with valid inputs" do
    visit "/#/groups"
    group_name = "Ben Franklin Labs"
    fill_in "group-name", with: group_name
    click_on "Save Group"
    expect(page).to have_content(group_name)
  end
end
