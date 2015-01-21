class LoginPage
  include Capybara::DSL

  def visit
    Capybara::visit '/sign_in'
  end

  def sign_in(email, password, options = {})
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    find('button', text: 'Sign in').click

    # Force Capybara to wait until the page actually
    # loads before doing whatever might happen next.
    if options[:wait_for_load].nil?
      find('h1', text: "Today's Lunch")
    end
  end

  def sign_out
    find('a', text: 'Sign out').click
  end

  def has_login_form?
    page.has_content?('Email') && page.has_content?('Password')
  end
end
