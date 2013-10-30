require 'spec_helper'

describe "groups/index" do
  before(:each) do
    assign(:groups, [
      stub_model(Group,
        :name => "Name",
        :description => "MyText"
      ),
      stub_model(Group,
        :name => "Name2",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of group" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 1
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
