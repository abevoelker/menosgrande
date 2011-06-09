require "spec_helper"

describe ShortenersController do

  describe "routing" do

    it "routes to #new" do
      # I wish the next line worked:
      # @request.host = Configuration.master_url
      get("#{Configuration.master_url}/shorteners/new").should route_to("shorteners#new")
    end

    it "routes to #create" do
      post("#{Configuration.master_url}/shorteners").should route_to("shorteners#create")
    end

    it "routes to #show" do
      get("/shorteners/1").should route_to("shorteners#show", :id => "1")
    end

  end
end
