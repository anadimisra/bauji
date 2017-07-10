require 'rails_helper'

RSpec.describe "workshops/show", type: :view do
  before(:each) do
    @workshop = assign(:workshop, Workshop.create!(
      :venue => "Venue",
      :city => "City",
      :country => "Country",
      :venue_map_link => "Venue Map Link",
      :description => "MyText",
      :seats => 2,
      :ticket_price => "9.99",
      :seo_meta_keywords => "Seo Meta Keywords",
      :seo_meta_description => "Seo Meta Description",
      :certification => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Venue/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/Venue Map Link/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Seo Meta Keywords/)
    expect(rendered).to match(/Seo Meta Description/)
    expect(rendered).to match(//)
  end
end
