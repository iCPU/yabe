class CreateYabeQueries < ActiveRecord::Migration
  def change
    create_table :yabe_queries do |t|
      t.string :query
      t.integer :ebay_cat
      t.integer :user_id
      t.timestamps

    end
      add_index :yabe_queries, [:user_id, :created_at]

  end
end
