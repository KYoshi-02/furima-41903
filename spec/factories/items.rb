FactoryBot.define do
  factory :item do
    item_name { 'サンプル商品' }
    item_description { 'これはテスト用の商品説明です。' }
    item_status_id { 2 }
    item_category_id { 2 }
    shipping_cost_id { 2 }
    shipping_date_id { 2 }
    prefecture_id { 2 }
    price { 1000 }

    association :user

    trait :with_image do
      after(:build) do |item|
        item.image.attach(
          io: File.open(Rails.root.join('spec/fixtures/files/test_image.jpeg')),
          filename: 'test_image.jpeg',
          content_type: 'image/jpeg'
        )
      end
    end
  end
end
