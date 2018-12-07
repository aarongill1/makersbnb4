feature 'create listing' do
  scenario 'user should be able to create and see a list' do

    visit('/')
    click_link('Login / Sign up')
    within('form.sign-up') do
      fill_in('username', with: 'test_account')
      fill_in('email', with: 'test_account@msn.com')
      fill_in('password', with: 'password123')
      fill_in('phone_number', with: '07777777777')
      fill_in('first_name', with: 'test')
      fill_in('last_name', with: 'account')
      click_button('Sign Up')
    end

      click_link('Add a new property here')

    within('form.property-details') do
    fill_in('title', with: 'Tea House')
    fill_in('description', with:'test description')
    fill_in('price', with: '50')
    fill_in('guests', with: '2')
    fill_in('city', with: 'city')
    fill_in('bedrooms', with: '1')
    fill_in('beds', with: '1')
    fill_in('bathrooms', with: '1')
    fill_in('date_from', with: '2018-12-05')
    fill_in('date_to', with: '2018-12-12')
    click_button('Submit')
  end

    expect(page).to have_content('Tea House')
    expect(page).to have_content('test description')
    expect(page).to have_content('£50 per night')
    expect(page).to have_content('2018-12-05')
    expect(page).to have_content('2018-12-12')

  end
end
