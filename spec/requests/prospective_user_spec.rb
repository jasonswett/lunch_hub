require 'spec_helper'

describe "ProspectiveUsers" do
  describe "GET /prospective_user" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get prospective_users_path
      response.status.should be(200)
    end
  end
end
