class LoginPage
  include Capybara::DSL

  def sign_in(email, password)
    fill_in "email", with: email
    fill_in "password", with: password
    find("button", text: "Sign in").click
  end
end
