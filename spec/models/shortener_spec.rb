require 'spec_helper'

describe Shortener do

  before(:each) do
    @attr = { :url => "http://www.google.com",
              :key => "a" }
  end

  it "should create a new instance given valid attributes" do
    Shortener.create!(@attr)
  end

  it "should require a url" do
    no_url_shortener = Shortener.new(@attr.merge(:url => ""))
    no_url_shortener.should_not be_valid
  end

  it "should reject duplicate urls" do
    # Put a shortener with given url into the database.
    Shortener.create!(@attr)
    shortener_with_duplicate_url = Shortener.new(@attr)
    shortener_with_duplicate_url.should_not be_valid
  end

end
