json.extract! content, :id, :lesson_number, :lesson_description, :class_room, :lesson_teacher, :created_at, :updated_at
json.url content_url(content, format: :json)
