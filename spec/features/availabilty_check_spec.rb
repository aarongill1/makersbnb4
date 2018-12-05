feature 'Viewing available dates' do
  scenario 'A user can view properties that are available on a given date' do

    check_in = Date.parse("2018-04-12")
    check_out = Date.parse("2018-04-12")

    user_2 = User.create(
      username: "testAccount2",
      email: "testingacc2@hotmail.com",
      phone_number: "07738623766",
      first_name: "Test",
      last_name: "Account",
      password: "password123"
    )

    property_1 = Property.create(
      user_id: user_2.id,
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

    visit('/')
    fill_in "check_in", :with => "2018-12-04"
    fill_in "check_out", :with => "2018-12-06"
    click_button("Check Availabilty")
    click_button('View Property')
    expect(page).to have_content 'Spacious 2 bedroom house near the beach'
  end
end
