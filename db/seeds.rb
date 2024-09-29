User.find_or_create_by!(email: "taro@example.com") do |user|
  user.password = "password"
  user.name = "tarou"
end

