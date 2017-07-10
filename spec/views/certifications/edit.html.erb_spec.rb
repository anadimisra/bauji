require 'rails_helper'

RSpec.describe "certifications/edit", type: :view do
  before(:each) do
    @certification = assign(:certification, Certification.create!(
      :name => "MyString",
      :description => "MyText",
      :terms => "MyText",
      :seo_meta_keywords => "MyString",
      :seo_meta_description => "MyString"
    ))
  end

  it "renders the edit certification form" do
    render

    assert_select "form[action=?][method=?]", certification_path(@certification), "post" do

      assert_select "input[name=?]", "certification[name]"

      assert_select "textarea[name=?]", "certification[description]"

      assert_select "textarea[name=?]", "certification[terms]"

      assert_select "input[name=?]", "certification[seo_meta_keywords]"

      assert_select "input[name=?]", "certification[seo_meta_description]"
    end
  end
end
