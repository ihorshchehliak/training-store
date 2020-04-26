RSpec.describe "Home page" do
  let!(:user) { create(:user) }
  let!(:home_page) { HomePage.new }
  
  context "Open home page with books" do

    it 'without books' do
      home_page.load  

      expect(home_page.filters_title.text).to include('Filters')
      expect(home_page.catalog_title.text).to include('Catalog')
      expect(home_page.no_books_title.text).to include('Can`t find books')
    end
  end

  context 'Open home page with books' do
    let(:category_1) { create(:category) }
    let(:category_2) { create(:category) }
    let!(:books_list_1) { create_list(:book, 7, category: category_1) }
    let!(:books_list_2) { create_list(:book, 6, category: category_2) }
  
    it 'with books' do
      home_page.load
      home_page.view_more_button.click

      expect(home_page).to have_books(count: 10)
    end
  end
end
