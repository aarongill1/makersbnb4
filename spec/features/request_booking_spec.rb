feature 'request booking' do
  scenario 'successful request' do
    user = User.create(
      username: "testAccount2",
      email: "testingacc2@hotmail.com",
      phone_number: "07738623766",
      first_name: "Test",
      last_name: "Account",
      password: "password123"
    )

    property = Property.create(
      user_id: user.id,
      title: "A test House",
      description: "Spacious 2 bedroom house near the beach.",
      price: 130,
      city: "Margate",
      guests: 4,
      bedrooms: 2,
      beds: 2,
      bathrooms: 1,
      available_from: Date.parse("2018-12-04"),
      available_to:  Date.parse("2019-02-04"),
      photo_url:"https://tinyurl.com/ydfuwacb"
    )

    visit('user/new')
    within('form.existing-user') do
      fill_in('username', with: 'testAccount2')
      fill_in('password', with: 'password123')
      click_button('Log In')
    end

    visit('/')
    fill_in 'trip-start', with: '2018-12-04'
    click_button("Check Availabilty")

    expect(current_path).to eq('/')
    click_button "View Property"

    expect(current_path).to eq("/property/#{property.id}")
    fill_in 'date_requested', with: '2018-12-04'
    click_button 'Submit Booking Request'

    expect(current_path).to eq('/booking/request_submitted')
    expect(page).to have_content('Your Booking Request has been Submitted')
    expect(page).to have_content('Your booking request has been sent to the host for approval. You will be notified of their response.')
    expect(page).to have_button('Go to Homepage')
    expect(page).to have_button('Go to User Details Page')
  end
  feature 'Unsuccessful booking requests' do
    scenario 'Due to pre-existing booking' do
      user = User.create(
        username: "testAccount2",
        email: "testingacc2@hotmail.com",
        phone_number: "07738623766",
        first_name: "Test",
        last_name: "Account",
        password: "password123"
      )

      property = Property.create(
        user_id: user.id,
        title: "A test House",
        description: "Spacious 2 bedroom house near the beach.",
        price: 130,
        city: "Margate",
        guests: 4,
        bedrooms: 2,
        beds: 2,
        bathrooms: 1,
        available_from: Date.parse("2018-12-04"),
        available_to:  Date.parse("2019-02-04"),
        photo_url:"https://tinyurl.com/ydfuwacb"
      )

      booking = Booking.create(
        user_id: user.id,
        property_id: property.id,
        start_date: '2018-12-04',
        status: 'approved'
      )

      visit('user/new')
      within('form.existing-user') do
        fill_in('username', with: 'testAccount2')
        fill_in('password', with: 'password123')
        click_button('Log In')
      end

      visit('/')
      fill_in 'trip-start', with: '2018-12-04'
      click_button("Check Availabilty")

      expect(current_path).to eq('/')
      click_button "View Property"

      expect(current_path).to eq("/property/#{property.id}")
      expect(page).not_to have_content('This property is not available on 2018-12-04')
      fill_in 'date_requested', with: '2018-12-04'
      click_button 'Submit Booking Request'

      expect(current_path).to eq("/property/#{property.id}")
      expect(page).to have_content('This property is not available on 2018-12-04')
    end
    scenario 'Due to pre-existing booking' do
      user = User.create(
        username: "testAccount2",
        email: "testingacc2@hotmail.com",
        phone_number: "07738623766",
        first_name: "Test",
        last_name: "Account",
        password: "password123"
      )

      property = Property.create(
        user_id: user.id,
        title: "A test House",
        description: "Spacious 2 bedroom house near the beach.",
        price: 130,
        city: "Margate",
        guests: 4,
        bedrooms: 2,
        beds: 2,
        bathrooms: 1,
        available_from: Date.parse("2018-12-04"),
        available_to:  Date.parse("2019-02-04"),
        photo_url:"https://tinyurl.com/ydfuwacb"
      )

      visit('user/new')
      within('form.existing-user') do
        fill_in('username', with: 'testAccount2')
        fill_in('password', with: 'password123')
        click_button('Log In')
      end

      visit('/')
      fill_in 'trip-start', with: '2018-12-04'
      click_button("Check Availabilty")

      expect(current_path).to eq('/')
      click_button "View Property"

      expect(current_path).to eq("/property/#{property.id}")
      expect(page).not_to have_content('This property is not available on 2018-12-01')
      fill_in 'date_requested', with: '2018-12-01'
      click_button 'Submit Booking Request'

      expect(current_path).to eq("/property/#{property.id}")
      expect(page).to have_content('This property is not available on 2018-12-01')
    end
  end
end
