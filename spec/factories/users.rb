FactoryBot.define do
  factory :user do
    nickname              { 'abcde' }
    email                 { 'abc@gmail.com' }
    password              { 'abc123' }
    password_confirmation { password }
    family_name           { '食品' }
    first_name            { '太郎' }
    birth_date            { '1989/10/15' }
  end
end
