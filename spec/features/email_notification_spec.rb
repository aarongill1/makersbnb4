feature 'Email notifications' do
  before(:each) do
  end
  scenario 'A user receives an email when signing up' do
    email = class_double("Email").as_stubbed_const
    allow(email).to receive(:create)
    visit '/user/new'
    within('form.sign-up') do
      fill_in('username', with: 'test_account')
      fill_in('email', with: 'test_account@msn.com')
      fill_in('password', with: 'password123')
      fill_in('phone_number', with: '07777777777')
      fill_in('first_name', with: 'test')
      fill_in('last_name', with: 'account')
      click_button('Sign Up')
      expect(email).to receive(:create)
    end
  end
end