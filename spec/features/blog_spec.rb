require 'spec_helper'

describe "Blog" do
	it "blog#index" do
		visit(root_path)
		expect(page).to have_content(' SOLO')
		expect(page).to have_css('li a.fa-rss')
	end
end