require "faker"

user = User.new(username: Faker::Internet.user_name, email: Faker::Internet.email)
user.save
10.times do
  post = Post.new(
    name: Faker::Commerce.product_name,
    url: Faker::Internet.url,
    votes: (0..1000).to_a.sample
  )
  post.user = user
  post.save!
end
