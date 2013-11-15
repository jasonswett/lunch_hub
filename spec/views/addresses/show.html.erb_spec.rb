require 'spec_helper'

describe "address/show" do
  before(:each) do
    @address = assign(:address, stub_model(Address,
      :line1 => "Line1",
      :line2 => "Line2",
      :city => "City",
      :state => nil,
      :zip => "Zip"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Line1/)
    rendered.should match(/Line2/)
    rendered.should match(/City/)
    rendered.should match(//)
    rendered.should match(/Zip/)
  end
end
