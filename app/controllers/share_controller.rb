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
    
    
end