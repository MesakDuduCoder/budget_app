user = User.create!(name: "John Doe")
category = user.categories.create!(name: "Food", icon: "icon")
payment = user.payments.create!(name: "ForFood", amount: 10)
category.payments << payment
