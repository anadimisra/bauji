require 'rails_helper'

RSpec.describe "workshops/edit", type: :view do
  before(:each) do
    @workshop = assign(:workshop, Workshop.create!(
      :venue => "MyString",
      :city => "MyString",
      :country => "MyString",
      :venue_map_link => "MyString",
      :description => "MyText",
      :seats => 1,
      :ticket_price => "9.99",
      :seo_meta_keywords => "MyString",
      :seo_meta_description => "MyString",
      :certification => nil
    ))
  end

  it "renders the edit workshop form" do
    render

    assert_select "form[action=?][method=?]", workshop_path(@workshop), "post" do

      assert_select "input[name=?]", "workshop[venue]"

      assert_select "input[name=?]", "workshop[city]"

      assert_select "input[name=?]", "workshop[country]"

      assert_select "input[name=?]", "workshop[venue_map_link]"

      assert_select "textarea[name=?]", "workshop[description]"

      assert_select "input[name=?]", "workshop[seats]"

      assert_select "input[name=?]", "workshop[ticket_price]"

      assert_select "input[name=?]", "workshop[seo_meta_keywords]"

      assert_select "input[name=?]", "workshop[seo_meta_description]"

      assert_select "input[name=?]", "workshop[certification_id]"
    end
  end
end
