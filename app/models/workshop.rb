class Workshop < ApplicationRecord
  belongs_to :certification
  has_many :order_items
  has_many :learners, through: :order_items

  validates :venue, :city, :country, :starts_on, :ends_on, :starts_at, :ends_at, :seats, :ticket_price, :seo_meta_keywords, :seo_meta_description, presence: true

  validates :venue, :city, length: {
  	minimum: 4,
  	maximum: 50,
  	too_long: "Should not be more than %{count} characters",
  	too_short: "Should not be less that %{count} characters"
  }

  validates_date :starts_on, :on_or_after => lambda { Date.today + 45.days }
  validates_date :ends_on, :is_at => lambda { :starts_on + 1.day }

  validates_time :starts_at, :on_or_after => '8:30am',
                                :on_or_after_message => 'must be after opening time',
                                :before => '9:00am',
                                :before_message => 'must be before 9:00am latest' 

  validates_time :ends_at, :on_or_before => '5:30pm',
                                :on_or_before_message => 'must be before evening time',
                                :after => '5:00pm',
                                :before_message => 'must be after 5:00pm at the earliest' 

  validates :seats, numericality: {
  	integer_only: true,
    greater_than_or_equal_to: 10,
  	less_than_or_equal_to: 25
  }

  validates :ticket_price, numericality: {
  	greater_than_or_equal_to: 30000.00,
  	less_than_or_equal_to: 40000.00
  }

end