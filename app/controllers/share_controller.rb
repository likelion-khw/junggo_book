class ShareController < ApplicationController
    
    def buy_del
      @del = Book.find(params[:buy_del])
      @del.status = "판매중"
      @del.buyer=""
      @del.save
      
      redirect_to :back
    end
    
    def sel_del
      @del = Book.find(params[:sel_del])
      @del.destroy
  
      redirect_to :back
    end
    
    def deal_end
      @del = Book.find(params[:deal_num])
      @del.status = "판매완료"
      @del.save
  
      redirect_to :back
    end
    
    def review
      @new = Review.new
      @new.user_id = params[:user_id]
      @new.deal_id = params[:deal_id]
      @new.buyer_id = params[:buyer_id]
      @new.star = params[:star]
      @new.review = params[:review]
      
      @new.save
      
      @book = Book.find(params[:deal_id])
      @book.review = "ok" #리뷰가 있음을 표시
      @book.save
      render :nothing => true
    
    end
    
    def edit_book
      @edit = Book.find(params[:deal_num])
      @edit.book_title = params[:book_title]
      @edit.book_writer = params[:book_writer]
      @edit.book_company = params[:book_category]
      @edit.book_price = params[:book_price]
      @edit.sell_price = params[:sell_price]
      @edit.class_name = params[:class]
      @edit.teacher = params[:teacher]
      @edit.save
      
      redirect_to :back
    end
    

    
end