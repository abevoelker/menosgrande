require 'spec_helper'

describe "shorteners/edit.html.erb" do
  before(:each) do
    @shortener = assign(:shortener, stub_model(Shortener,
      :url => "MyString",
      :key => "MyString"
    ))
  end

  it "renders the edit shortener form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => shorteners_path(@shortener), :method => "post" do
      assert_select "input#shortener_url", :name => "shortener[url]"
      assert_select "input#shortener_key", :name => "shortener[key]"
    end
  end
end
