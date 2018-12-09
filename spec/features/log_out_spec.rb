feature 'Logging out' do
	scenario 'A user can log out' do
		user_1 = User.create(
		username: "testingAccount1",
		email: "testacc1@hotmail.com",
		phone_number: "07738623766",
		first_name: "Test",
		last_name: "Account",
		password: BCrypt::Password.create('password123')
		)

		visit('/')
		click_link("Login / Sign up")
		within('form.sign-in') do
      fill_in('username', with: 'testingAccount1')
      fill_in('password', with: 'password123')
      click_button('Log In')
    end

    expect(current_path).to eq('/user/details')
    click_button('Log Out')
    expect(current_path).to eq('/')
  end
end
