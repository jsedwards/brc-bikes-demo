FactoryGirl.define do 
  factory :user do 
    name 'Jeff'
    email 'jeff@example.com'
    password 'secret'
    password_confirmation 'secret'

    factory :admin_user do 
      admin true
    end
  end
end