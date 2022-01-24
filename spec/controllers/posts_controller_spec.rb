require 'spec_helper'

describe PostsController do
    
    describe "GET#index" do
        before { get :index }

        it { should respond_with(200) }
        it { should render_template(:index) }
    end

    describe "GET#show" do
        before do
            @post = Factory(:post)
            get :show, :id => @post.id
        end
        it { should respond_with(200) }
        it { should render_template(:show) }
        it { should assign_to(:post).with(@post)  }
    end

    describe "GET#new" do
        before { get :new }
        it { should respond_with(200) }
        it { should render_template(:new) }
      end
    
    describe "POST#create" do
        context "post with valid data" do
            before do
                @post  = Factory.attributes_for(:post) 
                post :create, :post => @post 
            end
            it { response.should be_redirect }
        end

        context "post with invalid data" do
            before do
                @post = Factory.attributes_for(:invalid_post)
                post :create, :post => @post
            end
            it { should render_template(:new) }
        end
        
    end

    describe "GET#edit" do
        before do
            @post = Factory(:post)
            post :edit, :id => @post.id
        end
        it { should respond_with(200) }
        it { should assign_to(:post).with(@post) }
        it { should render_template(:edit) }
    end

    describe "PUT#update" do
        before { @post = Factory(:post) }
        
        context "update with valid data" do
            before do
                put :update, :id => @post.id, :post => { :title => "change" }
                @post.reload
            end
            it { @post.title.should == "change"  }
            it { should redirect_to(post_path) }
        end

        context "update with invalid data" do
            before do
                put :update, :id => @post.id, :post => { :title => nil }
                @post.reload
            end
            it { @post.title.should == "test post" }
            it { should render_template(:edit) }
        end
        
    end
    
    describe "DELETE#destroy" do
        before do 
            @post = Factory(:post)
            delete :destroy, :id => @post.id
        end
        it { should redirect_to("/posts") }
    end
    
    
end
