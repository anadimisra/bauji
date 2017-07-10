require 'rails_helper'

RSpec.describe "learners/new", type: :view do
  before(:each) do
    assign(:learner, Learner.new(
      :email => "MyString",
      :first_name => "MyString",
      :middle_name => "MyString",
      :last_name => "MyString",
      :mobile => "MyString",
      :country_code => "MyString",
      :company => "MyString",
      :job_role => "MyString"
    ))
  end

  it "renders new learner form" do
    render

    assert_select "form[action=?][method=?]", learners_path, "post" do

      assert_select "input[name=?]", "learner[email]"

      assert_select "input[name=?]", "learner[first_name]"

      assert_select "input[name=?]", "learner[middle_name]"

      assert_select "input[name=?]", "learner[last_name]"

      assert_select "input[name=?]", "learner[mobile]"

      assert_select "input[name=?]", "learner[country_code]"

      assert_select "input[name=?]", "learner[company]"

      assert_select "input[name=?]", "learner[job_role]"
    end
  end
end
