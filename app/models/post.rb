class Post < ActiveRecord::Base
    validates_uniqueness_of :title 
    validates_format_of :title , :with => /\A(?!^\d+$)^.+$\z/
    validates_length_of :title, :maximum => 100
    belongs_to :category
end
