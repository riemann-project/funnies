Fabricator :user do
  username { Fabricate.sequence(:username) { |i| "leekelby-#{i}" } }
  email { Fabricate.sequence(:email) { |i| "user+#{i}@example.com" } }
  password "password"
  password_confirmation { |user| user.password }
end

Fabricator :confirmed_user, from: :user do
  after_create { |user| user.confirm! }
end

Fabricator :admin, from: :confirmed_user do
  admin true
end
