require 'spec_helper'

describe "shorteners/show.html.erb" do
  before(:each) do
    @shortener = assign(:shortener, stub_model(Shortener,
      :url => "Url",
      :key => "Key"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Key/)
  end
end
