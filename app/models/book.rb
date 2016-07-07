class Book < ActiveRecord::Base
    has_many :replies
    self.per_page = 8
    

end

WillPaginate.per_page = 16