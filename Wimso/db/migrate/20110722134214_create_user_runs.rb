class CreateUserRuns < ActiveRecord::Migration
  def change
    create_table :user_runs do |t|
      t.integer :interval
      t.date :iv_change
      t.references :comments
      t.integer :curr_eps
      t.references :user
      t.references :run

      t.timestamps
    end
    add_index :user_runs, :comments_id
    add_index :user_runs, :user_id
    add_index :user_runs, :run_id 
  end
end
