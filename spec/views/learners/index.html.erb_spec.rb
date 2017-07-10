require 'rails_helper'

RSpec.describe "learners/index", type: :view do
  before(:each) do
    assign(:learners, [
      Learner.create!(
        :email => "Email",
        :first_name => "First Name",
        :middle_name => "Middle Name",
        :last_name => "Last Name",
        :mobile => "Mobile",
        :country_code => "Country Code",
        :company => "Company",
        :job_role => "Job Role"
      ),
      Learner.create!(
        :email => "Email",
        :first_name => "First Name",
        :middle_name => "Middle Name",
        :last_name => "Last Name",
        :mobile => "Mobile",
        :country_code => "Country Code",
        :company => "Company",
        :job_role => "Job Role"
      )
    ])
  end

  it "renders a list of learners" do
    render
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Middle Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Mobile".to_s, :count => 2
    assert_select "tr>td", :text => "Country Code".to_s, :count => 2
    assert_select "tr>td", :text => "Company".to_s, :count => 2
    assert_select "tr>td", :text => "Job Role".to_s, :count => 2
  end
end
