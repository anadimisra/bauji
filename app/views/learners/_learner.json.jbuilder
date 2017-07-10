json.extract! learner, :id, :email, :first_name, :middle_name, :last_name, :mobile, :country_code, :company, :job_role, :created_at, :updated_at
json.url learner_url(learner, format: :json)
