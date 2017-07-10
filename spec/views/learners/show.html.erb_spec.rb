require 'rails_helper'

RSpec.describe "learners/show", type: :view do
  before(:each) do
    @learner = assign(:learner, Learner.create!(
      :email => "Email",
      :first_name => "First Name",
      :middle_name => "Middle Name",
      :last_name => "Last Name",
      :mobile => "Mobile",
      :country_code => "Country Code",
      :company => "Company",
      :job_role => "Job Role"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Middle Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Mobile/)
    expect(rendered).to match(/Country Code/)
    expect(rendered).to match(/Company/)
    expect(rendered).to match(/Job Role/)
  end
end
