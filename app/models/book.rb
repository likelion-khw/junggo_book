class Book < ActiveRecord::Base
    has_many :replies
    has_many :reviews
    self.per_page = 8
    

end

WillPaginate.per_page = 16