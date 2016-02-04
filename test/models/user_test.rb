require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:barebones)
  end

  test 'barebones user must be valid' do
    assert @user.valid?
  end

  test 'user must have a email' do
    @user.email = nil

    assert @user.invalid?
    assert_includes @user.errors[:email], "can't be blank"
  end

  test 'user email must be unique' do
    duplicated = User.new(email: @user.email)

    assert duplicated.invalid?
    assert_includes duplicated.errors[:email], 'has already been taken'
  end
end
