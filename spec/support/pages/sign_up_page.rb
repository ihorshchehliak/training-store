class SignUpPage < BasePage
  set_url '/users/sign_up'
  
  element :email, '#user_email'
  element :password, '#user_password'
  element :password_confirmation, '#user_password_confirmation'
  element :sign_up_button, '[name="commit"]'

  def submit_login_form_with(args)
    email.set(args[:email])
    password.set(args[:password])
    password_confirmation.set(args[:password_confirmation])
    sign_up_button.click
  end
end