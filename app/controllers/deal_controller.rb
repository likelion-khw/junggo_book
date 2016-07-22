class DealController < ApplicationController
  
  def sell_main
  end
  
  def sell_form
    
  end
  
  def sell_action
    
    book = Book.new
    
    book.status = "판매중"
    
    book.user_id = params[:user_id]
    
    book.book_title = params[:book_title]
    book.book_writer = params[:book_writer]
    book.book_company = params[:book_company]
    book.book_price = params[:book_price]
    book.book_category = params[:book_category]
    
    uploader = LoaderUploader.new
    uploader.store!(params[:pic])
    
    book.image_url = uploader.url
    
    
    book.class_name = params[:class]
    book.teacher = params[:teacher]
      
    book.out_state = params[:out_state]
    book.in_state = params[:in_state]
    book.saperate = params[:saperate]
      
    book.sell_price  = params[:sell_price]
      
    book.message_alert = params[:message_alert]
    book.save
    
    redirect_to :action => "user", :menu => "판매"
    
  end
  
  def buy_main
    @category = params[:category] #카테고리구분
    @check = params[:check]
    
    # if @category == "모든책"
    #   @list = Book.all
    # else
    #   @list = Book.where("book_category =?",@category)
    # end
    
    # if @check == "true"
    #   @list = @list.where("status =?", "판매중")
    # else
    #   @check == "false"
    # end
    
    # @paging = @list.page(params[:page])
    
    # @list = Book.order('created_at DESC').page(params[:page]).per_page(3)
    # @list = Book.paginate(page: params[:page], per_page: 3).order(created_at: :desc)
    # Book.paginate(:page => params[:page], :per_page => 3)
    # @list = Book.paginate(:page => params[:page], :per_page => 3).order("id desc")
    # @list = Book.where(:published => true).paginate(:page => params[:page]).order('id DESC')
    # @pagin = Book.paginate page: params[:page], order:'created_at desc', per_page: 3
    
    @list = Book.paginate(:page => params[:page])
    
    
  end
  
  def view
    @review = Review.all
    @book = Book.find(params[:id])
    @percent = ((1 - @book.sell_price.to_f/@book.book_price.to_f)*100).to_i
    # @replys = Reply.all
    
    
  end
  
  def reply
    
      reply = Reply.new
      reply.content = params[:contents]
      reply.user_id = current_user.id
      reply.book_id = params[:book_id]
      
      if reply.save
        redirect_to :back
      else 
        render :text => reply.errors.messages[:contents].first
      
      end
      
  end
  
  
  def buyer_update #구입버튼 누를시
    @update = Book.find(params[:book_id])
    @update.status = params[:status]
    @update.buyer = params[:buyer]
    @update.save
    render :nothing => true
  
    
  end
  
  def user
  end
  
  def check_user
    check = params[:check]
    arr = Array.new
    
    if check == "email"
      User.all.each do |user|
        arr << user.email #이메일들을 배열로
      end
      render json: {:result => arr.include?(params[:user_id])} #view로 데이터 보냄
    end
    
    if check == "nickname"
      User.all.each do |user|
        arr << user.nickname #이메일들을 배열로
      end
      render json: {:result => arr.include?(params[:user_name])} #view로 데이터 보냄
    end
  end
  
end
