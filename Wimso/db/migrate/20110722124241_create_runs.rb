class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.string :name
      t.integer :anz_staf
      t.integer :anz_eps
      t.decimal :rating
      t.references :comments
      t.references :episodes
      t.integer :anz_rating
      t.boolean :global
      t.references :tag

      t.timestamps
    end
    add_index :runs, :comments_id
    add_index :runs, :episodes_id
    add_index :runs, :tag_id
  end
end
