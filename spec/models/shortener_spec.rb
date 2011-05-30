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

  it "should accept valid urls" do
    uris = %w[http://foo.com http://www.foo.com https://www.foo.com
              http://foo.com/bar/baz/quux.html?q=123]
    uris.each do |uri|
      valid_url_shortener = Shortener.new(@attr.merge(:url => uri))
      valid_url_shortener.should be_valid
    end
  end

  it "should reject invalid urls" do
    uris = %w[htp://foo.com ftp://foo.com https://www.foo..com]
    uris.each do |uri|
      invalid_url_shortener = Shortener.new(@attr.merge(:url => uri))
      invalid_url_shortener.should_not be_valid
    end
  end

  it "should reject duplicate urls" do
    # Put a shortener with given url into the database.
    Shortener.create!(@attr)
    shortener_with_duplicate_url = Shortener.new(@attr)
    shortener_with_duplicate_url.should_not be_valid
  end

end
