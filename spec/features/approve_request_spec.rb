feature 'approve requests' do
  scenario 'host should be able to see and approve a request' do

    visit('/')
    click_link('Login / Sign up')
    within('form.user-details') do
      fill_in('username', with: 'test_account')
      fill_in('email', with: 'test_account@msn.com')
      fill_in('password', with: 'password123')
      fill_in('phone_number', with: '07777777777')
      fill_in('first_name', with: 'test')
      fill_in('last_name', with: 'account')
      click_button('Sign Up')

      expect(page).to have_content('Windmill')

    end



  end
end
