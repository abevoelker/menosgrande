require "spec_helper"

describe ShortenersController do
  describe "routing" do

    it "routes to #index" do
      get("/shorteners").should route_to("shorteners#index")
    end

    it "routes to #new" do
      get("/shorteners/new").should route_to("shorteners#new")
    end

    it "routes to #show" do
      get("/shorteners/1").should route_to("shorteners#show", :id => "1")
    end

    it "routes to #edit" do
      get("/shorteners/1/edit").should route_to("shorteners#edit", :id => "1")
    end

    it "routes to #create" do
      post("/shorteners").should route_to("shorteners#create")
    end

    it "routes to #update" do
      put("/shorteners/1").should route_to("shorteners#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/shorteners/1").should route_to("shorteners#destroy", :id => "1")
    end

  end
end
