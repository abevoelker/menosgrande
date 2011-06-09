require 'spec_helper'

describe "Shorteners" do

  describe "shorten a URL" do

    describe "success" do
      it "should make a new shortener" do
	lambda do
          visit "#{Configuration.master_url}/shorteners/new"
          fill_in 'shortener_url', :with => "http://abevoelker.com"
	  click_button
	  #response.should have_selector("div.flash.success")
	  #response.should render_template('shorteners/show')
        end.should change(Shortener, :count).by(1)
      end
    end

    describe "failure" do

      it "should not make a new shortener" do
	lambda do
          visit "#{Configuration.master_url}/shorteners/new"
          fill_in "shortener_url", :with => "invalid"
	  click_button
	  response.should render_template('shorteners/new')
	  response.should have_selector("div#error_explanation")
        end.should_not change(Shortener, :count)
      end
    end
  end

end
