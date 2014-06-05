require 'spec_helper'

describe "Posts" do

	it "display sign in when user not authorized" do
		visit "/posts"
		expect(page).to have_content('Sign')
	end

	it "display Invalid email or password when incorrect login" do
		visit "/posts"

		fill_in "login-username", :with => "incorect@incorect.com"
    fill_in "login-password", :with => "incorect"
    click_button "Sign in"

    expect(page).to have_content('Invalid')
  end

  it "display Signed in successfully when correct login" do
  	user = FactoryGirl.create(:user)
		user.save

		visit "/posts"

		fill_in "login-username", :with => "test@test.com"
    fill_in "login-password", :with => "Testing123"
    click_button "Sign in"

    expect(page).to have_content('Signed in successfully')
	end

	it "create new post" do
		user = FactoryGirl.create(:user)
		user.save

		visit "/posts"

		fill_in "login-username", :with => "test@test.com"
    fill_in "login-password", :with => "Testing123"
    click_button "Sign in"

    find("#posts_index").click

    expect(page).to have_content('New post')

    fill_in "Title", :with => "TitleText"
    fill_in "Body", :with => "BodyText"
    check 'Published'
    click_button "Create Post"

    expect(page).to have_content('TitleText')
	end

	it "update post" do
		user = FactoryGirl.create(:user)
		user.save

		visit "/posts"

		fill_in "login-username", :with => "test@test.com"
    fill_in "login-password", :with => "Testing123"
    click_button "Sign in"

		@post = Post.create(:title => 'TitleText', :body => 'BodyText')

		visit edit_post_path(@post)

		expect(page).to have_content('Editing post')

		fill_in 'Title', :with => 'New TitleText'
		check 'Published'
		click_button 'Update Post'
		expect(page).to have_content('New TitleText')
	end

	it "publishing post" do
		user = FactoryGirl.create(:user)
		user.save

		visit root_path

		expect(page).to_not have_content('TitleText')

		visit "/posts"

		fill_in "login-username", :with => "test@test.com"
    fill_in "login-password", :with => "Testing123"
    click_button "Sign in"

		@post = Post.create(:title => 'TitleText', :body => 'BodyText')

		visit edit_post_path(@post)
		check 'Published'
		click_button 'Update Post'

		visit root_path

		expect(page).to have_content('TitleText')
	end

end