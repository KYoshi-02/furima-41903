FactoryBot.define do
  factory :address do
    postcode { '123-4567' }
    prefecture_id { 2 }
    city { '渋谷区' }
    block { '1-2-3' }
    building { '渋谷ハイツ101' }
    phone_number { '09012345678' }
    association :order
  end
end
