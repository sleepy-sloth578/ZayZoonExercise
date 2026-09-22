FactoryBot.define do
  factory :employee do
    employer { nil }
    name { "MyString" }
    external_ref { "MyString" }
  end
end
