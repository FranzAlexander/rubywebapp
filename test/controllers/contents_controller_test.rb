require 'test_helper'

class ContentsControllerTest < ActionDispatch::IntegrationTest

  test "create content" do
    create_content
    assert true
  end

  test "find content" do
    a = find_content
    assert !a.blank?
  end

  test "delete content" do
    a = find_content.length
    delete_content
    b = find_content.length
    assert a > b
  end

  test "create content fail" do
    a = find_content.length
    create_content
    b = find_content.length
    assert a == b
  end
end
