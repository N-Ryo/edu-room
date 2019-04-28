json.extract! message, :id, :teacher_id, :student_id, :content, :image_url, :created_at, :updated_at
json.url message_url(message, format: :json)
