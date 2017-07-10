require 'rails_helper'

RSpec.describe "certifications/index", type: :view do
  before(:each) do
    assign(:certifications, [
      Certification.create!(
        :name => "Name",
        :description => "MyText",
        :terms => "MyText",
        :seo_meta_keywords => "Seo Meta Keywords",
        :seo_meta_description => "Seo Meta Description"
      ),
      Certification.create!(
        :name => "Name",
        :description => "MyText",
        :terms => "MyText",
        :seo_meta_keywords => "Seo Meta Keywords",
        :seo_meta_description => "Seo Meta Description"
      )
    ])
  end

  it "renders a list of certifications" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Seo Meta Keywords".to_s, :count => 2
    assert_select "tr>td", :text => "Seo Meta Description".to_s, :count => 2
  end
end
