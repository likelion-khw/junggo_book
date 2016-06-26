class HomeController < ApplicationController
  def main
  end
  
  def search
    @searching_keyword=params[:search]
    @search_output_book=Book.where("book_title LIKE ? or teacher LIKE ? or class_name LIKE ? or book_company LIKE ? or book_writer LIKE ?", "%#{@searching_keyword}%", "%#{@searching_keyword}%", "%#{@searching_keyword}%", "%#{@searching_keyword}%", "%#{@searching_keyword}%")
   
    
  end
  
end
