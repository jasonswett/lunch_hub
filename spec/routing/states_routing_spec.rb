require "spec_helper"

describe StatesController do
  describe "routing" do

    it "routes to #index" do
      get("/state").should route_to("state#index")
    end

    it "routes to #new" do
      get("/state/new").should route_to("state#new")
    end

    it "routes to #show" do
      get("/state/1").should route_to("state#show", :id => "1")
    end

    it "routes to #edit" do
      get("/state/1/edit").should route_to("state#edit", :id => "1")
    end

    it "routes to #create" do
      post("/state").should route_to("state#create")
    end

    it "routes to #update" do
      put("/state/1").should route_to("state#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/state/1").should route_to("state#destroy", :id => "1")
    end

  end
end
