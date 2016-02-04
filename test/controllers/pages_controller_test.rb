require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get home page' do
    get page_url('home')
    assert_response :success
  end
end
