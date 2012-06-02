namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Chris",
                         email: "c@c.c",
                         password: "foobar",
                         password_confirmation: "foobar")
    admin.toggle!(:admin)

    admin = User.create!(name: "Robin",
                         email: "r@r.r",
                         password: "foobar",
                         password_confirmation: "foobar")
    admin.toggle!(:admin)

    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstut.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    users = User.all(limit: 6)
    50.times do
      query = Faker::Lorem.sentence(3)
      r = Random.new
      category = r.rand(1...4000)
      users.each { |user| user.searches.create!(query: query, category: category) }
    end
  end
end
