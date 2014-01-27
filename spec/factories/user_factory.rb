FactoryGirl.define do 
  factory :user do 
    name 'Jeff'
    email 'jeff@example.com'
    password 'secret'
    password_confirmation 'secret'
  end
end