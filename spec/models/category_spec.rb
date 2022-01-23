require 'spec_helper'

describe Category do
  before(:each) do
    @category = Factory(:category)
  end

  subject { @category } 

  describe "Associations" do
    it { should have_many(:posts).dependent(:destroy) }
  end
  
  describe "Validations" do
    it { should validate_uniqueness_of(:name) }
    it { should allow_value("the loai").for(:name) }
    it { should ensure_length_of(:name) }
  end
  
end
