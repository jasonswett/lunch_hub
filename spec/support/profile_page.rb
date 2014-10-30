class ProfilePage
  include Capybara::DSL

  def visit
    Capybara::visit '/profile'
  end

  def complete_form(options)
    options.each { |id, value| fill_in id, with: value }
    click_on 'Save'
  end

  def has_success_message?
    page.has_content?('Your profile has been updated.')
  end
end
