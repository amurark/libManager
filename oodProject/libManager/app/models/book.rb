class Book < ActiveRecord::Base
   validates :ISBN, :presence => true,
                    :uniqueness => {:case_sensitive => false}
end
