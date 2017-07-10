require 'rails_helper'

RSpec.describe "workshops/index", type: :view do
  before(:each) do
    assign(:workshops, [
      Workshop.create!(
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
      ),
      Workshop.create!(
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
      )
    ])
  end

  it "renders a list of workshops" do
    render
    assert_select "tr>td", :text => "Venue".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "Venue Map Link".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Seo Meta Keywords".to_s, :count => 2
    assert_select "tr>td", :text => "Seo Meta Description".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
