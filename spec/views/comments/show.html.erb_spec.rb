require 'spec_helper'

describe "comments/show", :type => :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      :name => "Name",
      :email => "Email",
      :body => "MyText",
      :post_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
  end
end
