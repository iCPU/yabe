require 'csv'

cats = []

CSV.foreach('ebay_categories_vs91.csv', :headers => true) do |row|
  cat = Category.new
    cat.ebay_cat_name = row[2]
    cat.ebay_cat_id = row[0] 
    cat.parent_id = row[3]

    cats << cat
end

Category.import cats
