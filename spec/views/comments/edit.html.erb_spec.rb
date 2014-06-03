require 'spec_helper'

describe "comments/edit", :type => :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      :name => "MyString",
      :email => "MyString",
      :body => "MyText",
      :post_id => 1
    ))
  end

  it "renders the edit comment form" do
    render

    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do

      assert_select "input#comment_name[name=?]", "comment[name]"

      assert_select "input#comment_email[name=?]", "comment[email]"

      assert_select "textarea#comment_body[name=?]", "comment[body]"

      assert_select "input#comment_post_id[name=?]", "comment[post_id]"
    end
  end
end
