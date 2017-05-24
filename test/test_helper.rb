ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def create_user
    User.create(name: "testone", email: "testone@test.com", password: "testonetestone", password_confirmation: "testonetestone")
  end

  def find_user
    User.all
  end

  def create_content
    Content.create(lesson_number: 2, lesson_description: "dsadsad", class_room: "sd2", lesson_teacher: "dsdswwww")
  end

  def find_content
    Content.all
  end

  def create_content_fail
    Content.create(lesson_number: 2233)
  end

  def delete_content
    Content.all.first.destroy
  end

  def create_course
    Course.create(name: "coursesss", description: "sjsjsjuwuwuw", date_started: DateTime.now, date_ended: DateTime.now )
  end

  def create_course_fail
    Course.create(name: "sdjsadkhkj")
  end

  def find_course
    Course.all
  end

  def delete_course
    Course.all.first.destroy
  end

  # Add more helper methods to be used by all tests here...
end
