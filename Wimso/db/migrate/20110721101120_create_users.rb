class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :privacy_flag
      t.boolean :is_admin
      t.references :user
      t.references :series_db

      t.timestamps
    end
    add_index :users, :user_id
    add_index :users, :series_db_id
  end
end
