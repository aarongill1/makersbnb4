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
end
