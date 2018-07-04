json.extract! exercise, :id, :exercise_set_id, :name, :description, :duration, :position, :rest, :created_at, :updated_at
json.url exercise_url(exercise, format: :json)
