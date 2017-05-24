require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "Create User" do
    create_user
    assert true
  end

  test "Find User" do
    a = find_user
    assert !a.blank?
  end

end
