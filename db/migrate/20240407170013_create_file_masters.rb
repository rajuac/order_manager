class CreateFileMasters < ActiveRecord::Migration[7.0]
  def change
    create_table :file_masters do |t|
      t.string :file_type
      t.string :file_path 
      t.integer :user_id
      t.timestamps
    end
  end
end
