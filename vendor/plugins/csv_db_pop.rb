require 'csv'

cats = []

CSV.foreach('ebay_categories_vs91.csv', :headers => true) do |row|

  cat = Category.new
    cat.cat_name = row[2]
    cat.cat_id = row[0]
    cat.parent_id = row[3]
    cats << cat
end

Category.import cats
