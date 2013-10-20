require 'spec_helper'

describe "prospective_users/new" do
  before(:each) do
    assign(:prospective_user, stub_model(ProspectiveUser,
      :first_name => "MyString",
      :email => "john.smith@example.com"
    ).as_new_record)
  end

  it "renders new prospective_user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", prospective_users_path, "post" do
      assert_select "input#prospective_user_first_name[name=?]", "prospective_user[first_name]"
      assert_select "input#prospective_user_email[name=?]", "prospective_user[email]"
    end
  end
end
