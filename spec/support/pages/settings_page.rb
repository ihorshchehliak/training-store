class SettingsPage < BasePage
  set_url '/settings'

  #billing_address
  element :billing_first_name_input, '#billing_address_first_name'
  element :billing_last_name_input, '#billing_address_last_name'
  element :billing_address_input, '#billing_address_address'
  element :billing_city_input, '#billing_address_city'
  element :billing_zip_input, '#billing_address_zip'
  element :billing_country_input, '#billing_address_country'
  element :billing_address_phone_input, '#billing_address_phone'
  element :billing_submit_button, ".form-group.tel.required.billing_address_phone.form-group + input[type='submit']"

  #shipping_address
  element :shipping_first_name_input, '#shipping_address_first_name'
  element :shipping_last_name_input, '#shipping_address_last_name'
  element :shipping_address_input, '#shipping_address_address'
  element :shipping_city_input, '#shipping_address_city'
  element :shipping_zip_input, '#shipping_address_zip'
  element :shipping_country_input, '#shipping_address_country'
  element :shipping_address_phone_input, '#shipping_address_phone'
  element :shipping_submit_button, ".form-group.tel.required.shipping_address_phone.form-group + input[type='submit']"


  def set_country_option(country)
    shipping_country_input.click  
    within '#shipping_address_country' do
      find("option[value=#{country}]").click 
    end
  end

  def fill_billing_address_with(address_data)
    billing_first_name_input.set(address_data.first_name)
    billing_last_name_input.set(address_data.last_name)
    billing_address_input.set(address_data.address)
    billing_city_input.set(address_data.city)
    billing_zip_input.set(address_data.zip)
    billing_address_phone_input.set(address_data.phone)
  end

  def billing_address_blank?
    all_fields_blank?(:billing_first_name_input, :billing_last_name_input, :billing_address_input, :billing_city_input, :billing_zip_input, :billing_address_phone_input)
  end

  def fill_shipping_address_with(address_data)
    shipping_first_name_input.set(address_data.first_name)
    shipping_last_name_input.set(address_data.last_name)
    shipping_address_input.set(address_data.address)
    shipping_city_input.set(address_data.city)
    shipping_zip_input.set(address_data.zip)
    shipping_address_phone_input.set(address_data.phone)
  end

  def shipping_address_blank?
    all_fields_blank?(:shipping_first_name_input, :shipping_last_name_input, :shipping_address_input, :shipping_city_input, :shipping_zip_input, :shipping_address_phone_input)
  end
end