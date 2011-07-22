class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.references :run

      t.timestamps
    end
    add_index :tags, :run_id
  end
end
