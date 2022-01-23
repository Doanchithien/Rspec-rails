class Category < ActiveRecord::Base
    has_many :posts, :dependent => :destroy
    validates_length_of :name, :maximum => 50
    validates_format_of :name, :with => /\A[[:alpha:][:blank:]]+\z/
    validates_uniqueness_of :name
end