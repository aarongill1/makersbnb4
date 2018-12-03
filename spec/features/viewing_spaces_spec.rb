feature 'Viewing available spaces' do
  scenario 'A user can view spaces' do
    visit('/')
    expect(page).to have_content "Makers BNB"
    expect(page).to have_content "'Spacious 2 bedroom near city centre'"
  end

  scenario 'View individual space page' do
    visit('/')
    click_button ('view-space-1')
    expect(page).to have_content 'Spacious 2 bedroom near city centre'
    expect(page).to have_content '£130 per night'
    expect(page).to have_content '4 guests'
    expect(page).to have_content '2 bedrooms'
    expect(page).to have_content '2 beds'
    expect(page).to have_content '1 bathroom'
    expect(page).to have_content 'Dana'
    expect(page).to have_content '1234567890'
  end
end
