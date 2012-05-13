FactoryGirl.define do
  factory :user do
    name     "Frank Quietly"
    email    "f@f.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
