require 'spec_helper'

describe "address/index" do
  before(:each) do
    assign(:address, [
      stub_model(Address,
        :line1 => "Line1",
        :line2 => "Line2",
        :city => "City",
        :state => nil,
        :zip => "Zip"
      ),
      stub_model(Address,
        :line1 => "Line1",
        :line2 => "Line2",
        :city => "City",
        :state => nil,
        :zip => "Zip"
      )
    ])
  end

  it "renders a list of address" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Line1".to_s, :count => 2
    assert_select "tr>td", :text => "Line2".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Zip".to_s, :count => 2
  end
end
