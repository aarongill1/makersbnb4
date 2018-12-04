feature 'Viewing available dates' do
  scenario 'A user can view properties that are available on a given date' do

    user = User.create(
      username: "test"
    )

    property = Property.create(

      user_id: 1,
      title: "test",
      description: "Spacious 2 bedroom near city centre",
      price: 130,
      host_name: "Dana",
      host_number: "1234567890",
      city: "London",
      guests: 4,
      bedrooms: 2,
      beds: 2,
      bathrooms: 1,
      date_available: Date.parse("2018-12-04"),
      )

    visit('/')
    fill_in "check_in", :with => "04/12/2018"
    fill_in "check_out", :with => "13/12/2018"
    click_button('Check Availabilty')
    click_button('View Property')
    expect(page).to have_content 'Spacious 2 bedroom near city centre'
  end
  end
