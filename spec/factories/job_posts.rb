FactoryGirl.define do
#=begin	
	factory :job_post do
		name "DevOps Coach"
		location "Bangalore"
		experience (4..10)
		description 'Test Description'
		skills 'Test Skills'
		active true
		seo_meta_keywords ['keywords','keywords']
		seo_meta_description 'dummy descriptions'
	end

	factory :invalid_job_post, class: JobPost do
		name "No Name"
		location "Nay"
		experience (4..10)
		description "Test Description"
		skills 'Test skills'
		active true
		seo_meta_keywords ['keywords','keywords']
		seo_meta_description 'dummy descriptions'
	end

	factory :new_job_post, class: JobPost do
		name "DevOps Coach"
		location "Pune"
		experience (4..10)
		description 'Test Description'
		skills 'Test Skills'
		active true
		seo_meta_keywords ['keywords','keywords']
		seo_meta_description 'dummy descriptions'
	end
#=end
end