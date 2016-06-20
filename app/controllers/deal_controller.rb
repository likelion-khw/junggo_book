class DealController < ApplicationController
  def sell_main
  end
  
  def sell_form
    
  end
  
  def sell_action
    book = Book.new
    book.book_title = params[:book_title]
    book.book_writer = params[:book_writer]
    book.book_price = params[:book_price]
    book.book_category = params[:book_category]
      
    book.class_name = params[:class]
    book.teacher = params[:teacher]
      
    book.out_state = params[:out_state]
    book.in_state = params[:in_state]
    book.saperate = params[:saperate]
      
    book.sell_price  = params[:sell_price]
      
    book.message_alert = params[:message_alert]
    book.save
    
    redirect_to '/'
  end
  
  def buy_main
    @category = params[:category] #카테고리구분
  end
  
  def view
    @book = Book.find(params[:id])
    @percent = ((1 - @book.sell_price.to_f/@book.book_price.to_f)*100).to_i
  end
  
end
