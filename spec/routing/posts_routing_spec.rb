require "spec_helper"

describe PostsController, :type => :routing do
  describe "routing" do

    it { should route(:get, '/posts').to(controller: 'posts', action: 'index') }
    it { should route(:get, '/posts/new').to(controller: 'posts', action: 'new') }
    it { should route(:get, '/posts/1').to(controller: 'posts', action: 'show', id: '1') }
    it { should route(:get, '/posts/1/edit').to(controller: 'posts', action: 'edit', id: '1') }
    it { should route(:post, '/posts').to(controller: 'posts', action: 'create') }
    it { should route(:put, '/posts/1').to(controller: 'posts', action: 'update', id: '1') }
    it { should route(:delete, '/posts/1').to(controller: 'posts', action: 'destroy', id: '1') }

  end
end
