FactoryBot.define do
  factory :order_form do
    token         {"tok_abcdefghijk00000000000000000"}
    postal_code   { '123-4567' }
    prefecture_id { 28 }
    city          { 'Hirakata' }
    house_number  { '1-2-3' }
    building      { '森ビル' }
    phone_number  { '09012345678' }
  end
end