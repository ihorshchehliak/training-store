class LoginPage < BasePage
  set_url '/users/sign_in'

  element :email, '#user_email'
  element :password, "#user_password"
  element :forgot_password_link, "a[href='/users/password/new']"
  element :remember_me, 'label.checkbox-label'
  element :save_button, "input[value='Enter']"

  def fill_login_fields_with(args)
        email_input.set(args[:email])
        password_input.set(args[:password])
        save_button.click
  end
end