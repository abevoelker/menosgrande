require 'spec_helper'

describe Shortener do

  before(:each) do
    @attr = { :url => "http://www.abevoelker.com" }
  end

  it "should create a new instance given valid attributes" do
    Shortener.create!(@attr)
  end

  it "should require a url" do
    no_url_shortener = Shortener.new(@attr.merge(:url => ""))
    no_url_shortener.should_not be_valid
  end

  it "should accept valid HTTP URIs" do
    uris = %w[http://foo.com http://www.foo.com https://www.foo.com
              http://foo.com/bar/baz/quux.html?q=123]
    uris.each do |uri|
      valid_url_shortener = Shortener.new(@attr.merge(:url => uri))
      valid_url_shortener.should be_valid
    end
  end

  it "should accept valid non-HTTP URIs" do
    uris = %w[ftp://foo.com skype:abevoelker?call]
    uris.each do |uri|
      valid_url_shortener = Shortener.new(@attr.merge(:url => uri))
      valid_url_shortener.should be_valid
    end
  end

  it "should reject banned URI schemes" do
    uris = %w[javascript:alert("sometext"); file:///foo.txt]
    uris.push("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAA" + 
              "ACNbyblAAAAHElEQVQI12P4//8/w38GIAXDIBKE0DHxgljNBAAO9TXL0Y4O" +
              "HwAAAABJRU5ErkJggg==")
    uris.each do |uri|
      banned_uri_shortener = Shortener.new(@attr.merge(:url => uri))
      banned_uri_shortener.should_not be_valid
    end
  end

  it "should reject invalid URIs" do
    uris = %w[invalid!]
    uris.each do |uri|
      invalid_uri_shortener = Shortener.new(@attr.merge(:url => uri))
      invalid_uri_shortener.should_not be_valid
    end
  end

  it "should normalize URIs" do
    normalized_uri_shortener = Shortener.new(@attr.merge(:url => "http://ABEVOELKER.com"))
    normalized_uri_shortener.valid? # Force validations to run
    normalized_uri_shortener[:url].should == "http://abevoelker.com/"
  end

end
