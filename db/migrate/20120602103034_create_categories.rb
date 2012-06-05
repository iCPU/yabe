class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :ebay_cat_name
      t.integer :ebay_cat_id

      t.timestamps
    end
  end
end
