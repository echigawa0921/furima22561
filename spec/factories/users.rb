FactoryBot.define do
  factory :user do
    email                 { 'bbbbb@gmail.com' }
    password              { '1a1a1a' }
    password_confirmation { password }
    nickname              { 'sada' }
    first_name            { '山田' }
    last_name             { '太郎' }
    first_name_kana       { 'ヤマダ' }
    last_name_kana        { 'タロウ' }
    birthday              { '1995-11-17' }
  end
end