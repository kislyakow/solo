require "spec_helper"

describe BlogController, :type => :routing do
  describe "routing" do
  	it { should route(:get, '/blog/index').to(controller: 'blog', action: 'index') }
  end
end
