require "ffaker"

FactoryGirl.define do
  factory :workshop do
    venue FFaker::Venue.name
    city FFaker::Address.city
    country "India"
    venue_map_link nil
    description "MyText"
    starts_on { Date.today + 50.days }
    ends_on { Date.today + 51.days }
    starts_at Time.zone.parse((Date.today + 45.days).to_s+' 8:45')
    ends_at Time.zone.parse((Date.today + 45.days).to_s+' 17:30')
    seats 20
    ticket_price 40000.00
    seo_meta_keywords ["workshop","workshop"]
    seo_meta_description FFaker::Conference.name
    certification
  end
end
