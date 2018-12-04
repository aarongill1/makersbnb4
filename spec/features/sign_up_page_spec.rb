feature 'Sign up page' do
  scenario 'sign up page form' do
    visit '/user/new'
    expect(page).to have_field 'username'
    expect(page).to have_field 'email'
    expect(page).to have_field 'first_name'
    expect(page).to have_field 'last_name'
    expect(page).to have_field 'password'
    expect(page).to have_field 'phone_number'
    expect(page).to have_button 'Submit'
  end

  scenario 'A user can sign up' do
    visit '/user/new'
    fill_in('username', with: 'test_account')
    fill_in('email', with: 'test_account@msn.com')
    fill_in('password', with: 'password123')
    fill_in('phone_number', with: '07777777777')
    fill_in('first_name', with: 'test')
    fill_in('last_name', with: 'account')
    click_button('Submit')
    expect(current_path).to eq('/user/details')
    expect(page).to have_content('test_account')
    expect(page).to have_content('test_account@msn.com')
    expect(page).to have_content('07777777777')
    expect(page).to have_content('test')
    expect(page).to have_content('account')
  end 
end


