require 'spec_helper'

describe "LayoutLinks" do

  # Note: Configuration.master_url is required due to how behavior changes
  # based on hostname

  it "should have a home page at '/'" do
    get "#{Configuration.master_url}/"
    response.should have_selector('title', :content => "menosgrande")
  end

  it "should have an FAQ page at '/faq'" do
    get "#{Configuration.master_url}/faq"
    response.should have_selector('title', :content => "FAQ")
  end

  it "should have an API page at '/api'" do
    get "#{Configuration.master_url}/api"
    response.should have_selector('title', :content => "API")
  end

  it "should have a Privacy Policy page at '/privacy'" do
    get "#{Configuration.master_url}/privacy"
    response.should have_selector('title', :content => "Privacy Policy")
  end

  it "should have a Terms of Service page at '/tos'" do
    get "#{Configuration.master_url}/tos"
    response.should have_selector('title', :content => "Terms of Service")
  end
  
  it "should have the right links in the layout" do
    visit "#{Configuration.master_url}/"
    click_link "FAQ"
    response.should have_selector('title', :content => "FAQ")
    click_link "API"
    response.should have_selector('title', :content => "API")
    click_link "Privacy Policy"
    response.should have_selector('title', :content => "Privacy Policy")
    click_link "Terms of Service"
    response.should have_selector('title', :content => "Terms of Service")
  end
end

