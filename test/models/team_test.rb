require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  setup do
    @team = teams(:barebones)
  end

  test 'barebones team must be valid' do
    assert @team.valid?
  end

  test 'team must have a name' do
    @team.name = nil

    assert @team.invalid?
    assert_includes @team.errors[:name], "can't be blank"
  end

  test 'team name must be unique' do
    duplicated = Team.new(name: @team.name)

    assert duplicated.invalid?
    assert_includes duplicated.errors[:name], 'has already been taken'
  end

  test 'team name must not exceed 20 characters' do
    @team.name = 'a' * 21
    message = 'is too long (maximum is 20 characters)'

    assert @team.invalid?
    assert_includes @team.errors[:name], message
  end
end
