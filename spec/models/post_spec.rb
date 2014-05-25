require 'spec_helper'

describe Post, :type => :model do
	it { should validate_presence_of(:title) }
	it { should validate_presence_of(:body) }
end
