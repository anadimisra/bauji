json.extract! job_post, :id, :name, :location, :experience, :description, :skills, :active, :created_at, :updated_at
json.url job_post_url(job_post, format: :json)
