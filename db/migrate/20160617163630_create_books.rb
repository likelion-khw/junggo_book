class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :status
      
      t.integer :user_id
      
      t.string :book_title
      t.string :book_writer
      t.string :book_company
      t.integer :book_price
      t.string :book_category
      
      t.string :class_name
      t.string :teacher
      
      t.string :out_state
      t.string :in_state
      t.string :saperate
      
      t.integer :sell_price
      
      t.string :message_alert
      
      t.timestamps null: false
    end
  end
end
