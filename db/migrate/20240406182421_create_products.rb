class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :code
      t.text :name 
      t.string :category
      t.timestamps
    end
  end
end
