require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  test "Create course" do
    create_course
    assert true
  end
  test "Find course" do
    a = find_course
    assert !a.blank?
  end
  test "delete course" do
    a = find_course.length
    delete_course
    b = find_course.length
    assert a > b
  end
  test  "create course fail" do
  a = find_course.length
  create_course_fail
  b = find_course.length
  assert a == b
  end
end
