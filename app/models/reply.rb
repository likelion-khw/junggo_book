class Reply < ActiveRecord::Base
    belongs_to :book
    validates :content, presence: { message: "Story title is required" }
end
