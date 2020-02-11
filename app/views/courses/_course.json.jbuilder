json.extract! course, :id, :code, :description, :name, :created_at, :updated_at
json.url course_url(course, format: :json)
