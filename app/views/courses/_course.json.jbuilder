json.extract! course, :id, :name, :discription, :date_started, :date_ended, :created_at, :updated_at
json.url course_url(course, format: :json)
