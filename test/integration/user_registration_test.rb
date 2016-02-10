require 'test_helper'

class UserRegistrationTest < ActionDispatch::IntegrationTest
  test 'As anonymous user, I want to register and create my racing team' do
    visit root_path
    fill_in('Email', with: 'test@email.com')
    fill_in('Team', with: 'F1 Pimup Team')
    click_button('Apúntate')
    assert page.has_content?('Registration completed')
  end
end
