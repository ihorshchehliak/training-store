RSpec.describe 'Login' do
  let(:login_page) { LoginPage.new }
  let!(:home_page) { HomePage.new }
  let!(:user) { create :user }

  before do
    login_page.load
  end

  context 'Login with valid data' do
    it 'user logins' do
      login_page.fill_login_fields_with(email: user.email, password: user.password)

      expect(page).to have_content(I18n.t("devise.sessions.signed_in"))
      expect(login_page).to_not be_displayed
      expect(home_page).to be_displayed 
    end
  end

  context 'Login with invalid data' do
    let(:password) { FFaker::Internet.password }
    let!(:user) { create :user }
    
    it 'user does not login' do
      login_page.fill_login_fields_with(email: user.email, password: password)

      expect(page).to_not have_content("Signed in successfully.") 
      expect(page).to have_content("Invalid Email or password.") 
      expect(login_page).to be_displayed 
    end
  end
end