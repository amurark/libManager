class Book < ActiveRecord::Base
   self.primary_key = "ISBN"
end
