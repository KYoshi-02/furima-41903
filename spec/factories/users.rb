FactoryBot.define do
  factory :user do
    nick_name             { Faker::Name.name }
    email                 { Faker::Internet.unique.email }
    password              { 'test1234' }
    password_confirmation { 'test1234' }
    first_name            { '山田' }
    last_name             { '太郎' }
    first_name_kana       { 'ヤマダ' }
    last_name_kana        { 'タロウ' }
    birthday              { Faker::Date.birthday }
  end
end
