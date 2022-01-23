require 'spec_helper'

describe Post do
  
  before(:each) do
    @post = Factory(:post)
  end

  subject { @post } 

  describe "Validations" do
    it { should validate_uniqueness_of(:title) }
    it { should allow_value("test 123").for(:title) }  
    it { should ensure_length_of(:title) }
  end
  
  describe "Associations" do
    it { should belong_to(:category) }
  end

end