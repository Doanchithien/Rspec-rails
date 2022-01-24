require 'spec_helper'

describe CategoriesController do  

  describe 'GET #index' do
    before { get :index }

    it { should respond_with(200) }
    it { should render_template(:index)}
  end

  describe "GET#show" do
    before do
      @category = Factory(:category)
      get :show, :id => @category.id
    end
    it { should respond_with(200) }
    it { should render_template(:show) }
    it { should assign_to(:category).with(@category) }
  end 
  

  describe "GET#new" do
    before { get :new }
    it { should respond_with(200) }
    it { should render_template(:new) }
  end

  describe "POST#create" do

    context "Post category with valid data" do
      before do
        @category = Factory.attributes_for(:category)
        post :create, :category => @category
      end
      it { should redirect_to("/categories") }
    end

    context "Post category with invalid data" do
      before do
        @category = Factory.attributes_for(:invalid_category)
        post :create, :category => @category
      end
      it { should render_template(:new) }
    end
    
  end

  describe "GET#edit" do
    before do
      @category = Factory(:category)
      get :edit, :id => @category.id
    end
    it { should respond_with(200) }
    it { should render_template(:edit) }
    it { should assign_to(:category).with(@category) }
  end
  

  describe "PUT#update" do
    before { @category = Factory(:category) }

    context "Update category with valid data" do
      before do
        put :update, :id => @category.id, :category => { :name => "xyz" }
        @category.reload
      end
      it { @category.name.should == "xyz" }
      it { should redirect_to(category_path) }
    end

    context "Update category with invalid data" do
      before do
        put :update, :id => @category.id, :category => { :name => nil }
        @category.reload
      end
      it { @category.name.should == "test category" }
      it { should render_template(:edit) }
    end
    
  end

  describe "DELETE#destroy" do
    before do
      @category = Factory(:category)
      delete :destroy, :id => @category.id 
    end
    it { should redirect_to("/categories") }
  end
  

end
