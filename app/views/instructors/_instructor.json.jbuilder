json.extract! instructor, :id, :email, :first, :middle, :last, :created_at, :updated_at
json.url instructor_url(instructor, format: :json)
