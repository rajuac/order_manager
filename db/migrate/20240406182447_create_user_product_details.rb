class CreateUserProductDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :user_product_details do |t|
      t.references :user 
      t.references :product 
      t.date :order_date
      t.timestamps
    end
  end
end
