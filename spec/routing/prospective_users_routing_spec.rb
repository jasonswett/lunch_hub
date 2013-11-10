require "spec_helper"

describe ProspectiveUsersController do
  describe "routing" do
    it "routes to #new" do
      get("/prospective_users/new").should route_to("prospective_users#new")
    end

    it "routes to #create" do
      post("/prospective_users").should route_to("prospective_users#create")
    end
  end
end
