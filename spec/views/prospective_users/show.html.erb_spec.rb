require 'spec_helper'

describe "prospective_users/show" do
  before(:each) do
    @prospective_user = assign(:prospective_user, stub_model(ProspectiveUser,
      :first_name => "First Name",
      :email => "john.smith@example.com"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    rendered.should match(/john.smith@example.com/)
  end
end
