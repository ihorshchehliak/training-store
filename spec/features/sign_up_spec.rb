RSpec.describe 'SignUp' do
  let(:sign_up_page) { SignUpPage.new }
  let(:email) { FFaker::Internet.email }
  let(:password) { FFaker::Internet.password }
  let(:password_confirmation) {FFaker::Internet.password_confirmation }
  let!(:home_page) { HomePage.new }
  let(:user_data) do
    {
      email: email,
      password: password,
      password_confirmation: password_confirmation
    }
  end
  
  before do
    sign_up_page.load
  end
  
  context 'Sign up with valid data' do
    it 'user signs up' do
      sleep(3)
      sign_up_page.email.set(email)
      sign_up_page.password.set(password)
      sign_up_page.password_confirmation.set(password)
      sign_up_page.sign_up_button.click
      expect(page).to have_content('Welcome! You have signed up successfully.')
    end
  end

  context "Sign up with invalid data - incorrect email" do
    let(:email) { 'abcd' }
    it 'user does not sign up' do
      sign_up_page.submit_login_form_with(user_data)
      expect(page).to have_content("Password confirmation doesn't match Password")
      expect(sign_up_page).to_not be_displayed 
      expect(users_page).to be_displayed
      expect(navbar).to_not have_user_email_link    
    end
  end
end