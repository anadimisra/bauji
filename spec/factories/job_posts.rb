FactoryGirl.define do
	factory :job_post do
		name "No Name"
		location "Nay"
		experience 4..10
		description "Test Description"
		skills 'Test skills'
		active true
		seo_meta_keywords ['keywords']
		seo_meta_description ['descriptions']
	end
end