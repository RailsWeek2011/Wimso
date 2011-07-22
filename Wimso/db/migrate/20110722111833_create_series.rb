class CreateSeries < ActiveRecord::Migration
  def change
    create_table :series do |t|
      t.text :name
      t.integer :anz_staf
      t.integer :anz_eps
      t.decimal :rating
      t.references :comments
      t.references :episodes
      t.integer :anz_rating
      t.boolean :global

      t.timestamps
    end
    add_index :series, :comments_id
    add_index :series, :episodes_id
  end
end
