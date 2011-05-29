require 'spec_helper'

describe "shorteners/new.html.erb" do
  before(:each) do
    assign(:shortener, stub_model(Shortener,
      :url => "MyString",
      :key => "MyString"
    ).as_new_record)
  end

  it "renders new shortener form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => shorteners_path, :method => "post" do
      assert_select "input#shortener_url", :name => "shortener[url]"
      assert_select "input#shortener_key", :name => "shortener[key]"
    end
  end
end
