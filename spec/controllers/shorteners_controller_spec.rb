require 'spec_helper'

describe ShortenersController do

  render_views

  describe "GET show" do

    describe "failure" do

      it "should show a 404 error for nonexistent shorteners" do
	lambda {get :show, :key => 'doesntexist'}.should
	  raise_error(ActionController::RoutingError)
      end
    end

    describe "success" do

      before(:each) do
	@shortener = Factory(:shortener)
	@request.host = @shortener.read_attribute(:domain)
      end

      it "should find the right shortener" do
	get :show, :id => @shortener
	assigns(:shortener).should == @shortener
      end

      it "should be a redirect" do
	get :show, :id => @shortener
	response.should be_redirect
      end

      it "should redirect to the shortened url" do
	get :show, :id => @shortener
	response.should redirect_to(@shortener.url)
      end
    end
  end

  describe "POST 'create'" do

    describe "failure" do

      before(:each) do
        @attr = { :url => "" }
      end

      it "should not create a shortener" do
        lambda do
          post :create, :shortener => @attr
        end.should_not change(Shortener, :count)
      end

    end

    describe "success" do

      before(:each) do
        @attr = { :url => "http://www.abevoelker.com" }
      end

      it "should create a shortener" do
        lambda do
          post :create, :shortener => @attr
        end.should change(Shortener, :count).by(1)
      end
    end
  end
end
