require 'spec_helper'

describe "address/new" do
  before(:each) do
    assign(:address, stub_model(Address,
      :line1 => "MyString",
      :line2 => "MyString",
      :city => "MyString",
      :state => nil,
      :zip => "MyString"
    ).as_new_record)
  end

  it "renders new address form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", addresses_path, "post" do
      assert_select "input#address_line1[name=?]", "address[line1]"
      assert_select "input#address_line2[name=?]", "address[line2]"
      assert_select "input#address_city[name=?]", "address[city]"
      assert_select "input#address_state[name=?]", "address[state]"
      assert_select "input#address_zip[name=?]", "address[zip]"
    end
  end
end
