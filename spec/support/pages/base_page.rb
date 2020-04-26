class BasePage < SitePrism::Page
  def all_fields_blank?(*item_list)
      item_list.all? { |item| send(item).value.blank? }
  end
end