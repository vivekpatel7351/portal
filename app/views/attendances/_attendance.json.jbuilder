json.extract! attendance, :id, :student_id, :subject_id, :date, :status, :created_at, :updated_at
json.url attendance_url(attendance, format: :json)
