2.times do |i|
  User.create!(username: "Joshua #{i + 1}", password: "password#{i + 1}")
end
# . . .
2.times do |i|
  Book.create!(book_name: "Testing Book #{i + 1}", likes_books: i + 1, user_id: i + 1)
end
# . . .
Book.create!(book_name: "Testing Book #{3}", likes_books: 3, user_id: 2)
# . . .
User.create!(username: "Joshua #{3}", password: "password#{3}", admin: true)
