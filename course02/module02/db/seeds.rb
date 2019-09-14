# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Profile.destroy_all
User.destroy_all
TodoList.destroy_all
TodoItem.destroy_all

user_list = [
    ["Carly", "Fiorina", "female", 1954],
    ["Donald", "Trump", "male", 1946],
    ["Ben", "Carson", "male", 1951],
    ["Hillary", "Clinton", "female", 1947]
]

user_list.each do |first_name, last_name, gender, year|
  user = User.create! username: last_name, password_digest: '123456'
  user.create_profile! first_name: first_name, last_name: last_name, birth_year: year, gender: gender, user: user
  todo_list = user.todo_lists.create! list_name: "List #{last_name}", list_due_date: 1.year.from_now

  5.times { |i|
    todo_list.todo_items.create! due_date: 1.year.from_now, title: "Title #{i}", description: "Task #{i}", completed: false
  }
end