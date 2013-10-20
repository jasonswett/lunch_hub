require 'spec_helper'

describe "prospective_users/index" do
  before(:each) do
    assign(:prospective_users, [
      stub_model(ProspectiveUser,
        :first_name => "First Name",
        :email => "john.smith@example.com"
      ),
      stub_model(ProspectiveUser,
        :first_name => "First Name",
        :email => "john.smith@example.com"
      )
    ])
  end

  it "renders a list of prospective_user" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "john.smith@example.com".to_s, :count => 2
  end
end
