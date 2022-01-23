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
    before do
      @category = Factory.attributes_for(:category)
      post :create, :category => @category
    end
    it { should redirect_to("/categories") }
  end

  describe "PUT#update" do
    before do
      @category = Factory(:category)
      put :update, :id => @category.id, :category => { :name => "xyz", :description => "avd" }
    end

    it { should redirect_to() }
  end

  describe "DELETE#destroy" do
    before do
      @category = Factory(:category)
      delete :destroy, :id => @category.id 
    end
    it { should redirect_to("/categories") }
  end
  
  
  
  

end
