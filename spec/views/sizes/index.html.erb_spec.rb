require 'rails_helper'

RSpec.describe "sizes/index", type: :view do
  before(:each) do
    assign(:sizes, [
      Size.create!(
        :name => "Name"
      ),
      Size.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of sizes" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
