require 'spec_helper'

describe "comments/index", :type => :view do
  before(:each) do
    assign(:comments, [
      Comment.create!(
        :name => "Name",
        :email => "Email",
        :body => "MyText",
        :post_id => 1
      ),
      Comment.create!(
        :name => "Name",
        :email => "Email",
        :body => "MyText",
        :post_id => 1
      )
    ])
  end

  it "renders a list of comments" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
