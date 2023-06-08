# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "Mohaan", password: "123456")
User.create(username: "Raja", password: "123456")
User.create(username: "Ramesh", password: "123456")
User.create(username: "Ganesh", password: "123456")
User.create(username: "Krishna", password: "123456")

Message.create(body:  "Hello everyone", user_id: 1)
Message.create(body: "I'm Raja from India", user_id: 2)
Message.create(body:  "Welcome to the Chatter free site", user_id: 3)
Message.create(body: "Let's do something", user_id: 4)
Message.create(body:  "Can we play chess", user_id: 1)
Message.create(body:  "I like chess!!!", user_id: 3)

