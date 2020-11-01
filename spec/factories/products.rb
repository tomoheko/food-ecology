FactoryBot.define do
  factory :product do
    association :user
    name             { '冷凍かに鍋セット' }
    quantity         { '10kg' }
    explanation      { '北海道産' }
    category_id      { 3 }
    condition_id     { 3 }
    prefecture_id    { 2 }
    shipment_term_id { 3 }
    shipment_fee_id  { 3 }
    price            { 200_000 }
  end
end
