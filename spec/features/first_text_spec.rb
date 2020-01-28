RSpec.describe 'when categories list is shown' do
  it 'when we don't have books' do
    visit('/')
    within 'ul.list-inline' do
    sleep 10
    expect(page).to have_content('All')
    expect(page).to have_content('0')
  end
end

it 'when we have books with different categories' do
end
end
end