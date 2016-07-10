class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id #해당 판매자 id
      t.integer :deal_id #상품 id
      t.integer :buyer_id #구매자 아이디
      
      t.float :star #별점
      t.text :review #리뷰
      
      t.timestamps null: false
    end
  end
end
