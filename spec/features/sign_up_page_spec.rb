feature 'Sign up page' do
  scenario 'A user can sign up' do
    visit '/user/new'
    within('form.sign-up') do
      fill_in('username', with: 'test_account')
      fill_in('email', with: 'test_account@msn.com')
      fill_in('password', with: 'password123')
      fill_in('phone_number', with: '07777777777')
      fill_in('first_name', with: 'test')
      fill_in('last_name', with: 'account')
      click_button('Sign Up')
    end
    expect(current_path).to eq('/user/details')
    expect(page).to have_content('test_account')
    expect(page).to have_content('test_account@msn.com')
    expect(page).to have_content('07777777777')
    expect(page).to have_content('test')
    expect(page).to have_content('account')
  end 
end


