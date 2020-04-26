RSpec.describe "Settings" do
  let!(:user) { create(:user) }
  let(:home_page) { HomePage.new }
  let!(:settings_page) { SettingsPage.new }
  let!(:shipping_address) { build(:address) }
  let!(:billing_address) { build(:address, type: 'billing') }

  before do
    login_as(user) 
    home_page.load 
  end

  context 'Enter valid shipping address' do   
    it 'should save shipping address' do
      settings_page.fill_shipping_address_with(shipping_address)
      settings_page.set_country_option(shipping_address.country)
      settings_page.shipping_submit_button.click

      expect(settings_page).to be_displayed
      expect(settings_page).to_not be_shipping_address_blank 
      expect(page).to_not have_content(I18n.t("en.forms")) 
    end
  end

  context 'Enter billing address' do    
    it 'should save billing address' do
      settings_page.fill_billing_address_with(billing_address)
      settings_page.set_country_option(billing_address.country)
      settings_page.billing_submit_button.click
      
      expect(settings_page).to be_displayed 
      expect(settings_page).to_not be_billing_address_blank
      expect(page).to_not have_content(I18n.t("en.forms"))
    end
  end
end