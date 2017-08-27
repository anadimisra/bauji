json.extract! workshop, :id, :venue, :city, :country, :venue_map_link, :description, :starts_on, :ends_on, :starts_at, :ends_at, :seats, :ticket_price, :order_number, :exam_id, :seo_meta_keywords, :seo_meta_description, :certification_id, :created_at, :updated_at
json.url workshop_url(workshop, format: :json)
