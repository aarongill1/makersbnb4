feature 'approve requests' do
  scenario 'host should be able to see and approve a request' do
    # create host
    visit('/')
    click_link('Login / Sign up')
    within('form.sign-up') do
      fill_in('username', with: 'host_account')
      fill_in('email', with: 'host_account@msn.com')
      fill_in('password', with: 'password123')
      fill_in('phone_number', with: '07777777777')
      fill_in('first_name', with: 'host')
      fill_in('last_name', with: 'test_account')
      click_button('Sign Up')
      expect(current_path).to eq '/user/details'
    end

      expect(current_path).to eq '/user/details'
      # create property
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

      visit('/user/details')
      click_button 'Log Out'

      # create guest
      visit('/user/new')
      within('form.sign-up') do
        fill_in('username', with: 'guest_account')
        fill_in('email', with: 'guest_account@msn.com')
        fill_in('password', with: 'password123')
        fill_in('phone_number', with: '07777777777')
        fill_in('first_name', with: 'guest')
        fill_in('last_name', with: 'test_account')
        click_button('Sign Up')
      end
      click_link('search through the property listings')
      expect(current_path).to eq '/'

      fill_in 'trip-start', with: '2018-12-05'
      click_button("Check Availabilty")

      expect(current_path).to eq('/')
      click_button "View Property"

      fill_in 'date_requested', with: '2018-12-05'
      click_button 'Submit Booking Request'

      visit('/user/details')
      click_button 'Log Out'

      visit('/user/new')
      within('form.sign-in') do
        fill_in('username', with: 'host_account')
        fill_in('password', with: 'password123')
        click_button('Log In')
      end
      expect(page).to have_content('Tea House')
      expect(page).to have_content('Date requested: 2018-12-05')
      expect(page).to have_content('Booking status: Requested')

    end

end
