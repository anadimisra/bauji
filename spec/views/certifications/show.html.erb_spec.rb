require 'rails_helper'

RSpec.describe "certifications/show", type: :view do
  before(:each) do
    @certification = assign(:certification, Certification.create!(
      :name => "Name",
      :description => "MyText",
      :terms => "MyText",
      :seo_meta_keywords => "Seo Meta Keywords",
      :seo_meta_description => "Seo Meta Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Seo Meta Keywords/)
    expect(rendered).to match(/Seo Meta Description/)
  end
end
