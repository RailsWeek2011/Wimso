class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.integer :nr
      t.date :datum
      t.string :title
      t.decimal :rating
      t.integer :anz_rating
      t.references :run

      t.timestamps
    end
    add_index :episodes, :run_id
  end
end
