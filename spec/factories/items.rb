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

    after(:build) do |item|
      image_path = 'public/images/test_image.jpeg'
      item.image.attach(
        io: File.open(image_path),
        filename: 'test_image.jpeg',
        content_type: 'image/jpeg'
      )
    end
  end
end
