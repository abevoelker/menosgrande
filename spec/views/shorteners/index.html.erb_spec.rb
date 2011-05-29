require 'spec_helper'

describe "shorteners/index.html.erb" do
  before(:each) do
    assign(:shorteners, [
      stub_model(Shortener,
        :url => "Url",
        :key => "Key"
      ),
      stub_model(Shortener,
        :url => "Url",
        :key => "Key"
      )
    ])
  end

  it "renders a list of shorteners" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Key".to_s, :count => 2
  end
end
