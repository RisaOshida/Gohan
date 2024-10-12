User.find_or_create_by!(email: "taro@example.com") do |user|
  user.password = "password"
  user.name = "tarou"
end

Category.find_or_create_by!(name: "塩分控えめ")
Category.find_or_create_by!(name: "エネルギー控えめ")
Category.find_or_create_by!(name: "糖質控えめ")