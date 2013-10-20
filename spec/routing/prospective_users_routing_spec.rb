require "spec_helper"

describe ProspectiveUsersController do
  describe "routing" do

    it "routes to #index" do
      get("/prospective_users").should route_to("prospective_users#index")
    end

    it "routes to #new" do
      get("/prospective_users/new").should route_to("prospective_users#new")
    end

    it "routes to #show" do
      get("/prospective_users/1").should route_to("prospective_users#show", :id => "1")
    end

    it "routes to #edit" do
      get("/prospective_users/1/edit").should route_to("prospective_users#edit", :id => "1")
    end

    it "routes to #create" do
      post("/prospective_users").should route_to("prospective_users#create")
    end

    it "routes to #update" do
      put("/prospective_users/1").should route_to("prospective_users#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/prospective_users/1").should route_to("prospective_users#destroy", :id => "1")
    end

  end
end
