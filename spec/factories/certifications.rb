FactoryGirl.define do
	factory :certification do
		name "Nay"
		city "Way"
		venue "Yay"
		dates Date.today..Date.today+2.days
		schedule Time.now..Time.now+480.minutes
		seats 15
		unit_price 40000.00
		venue_map_link "http://maps.google.com/foo?x=y"
		description "Dummy Description"
		terms "Dummy Terms"
		seo_meta_keywords ['keyword']
		seo_meta_description ['description']
	end
end