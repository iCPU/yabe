require 'spec_helper'

describe "categories/index" do
  before(:each) do
    assign(:categories, [
      stub_model(Category,
        :cat_name => "Cat Name",
        :cat_id => 1,
        :parent_id => 2,
        :lft => 3,
        :rgt => 4
      ),
      stub_model(Category,
        :cat_name => "Cat Name",
        :cat_id => 1,
        :parent_id => 2,
        :lft => 3,
        :rgt => 4
      )
    ])
  end

  it "renders a list of categories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Cat Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
