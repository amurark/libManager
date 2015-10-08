class Book < ActiveRecord::Base
   validates :ISBN, :presence => true,
                    :uniqueness => {:case_sensitive => false}
   attr_accessor :flag
   attr_accessor :flag2
end
