# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Profile.destroy_all

User.create! [
	{ username: "Fiorina", password_digest: "FFFF" },
	{ username: "Trump",   password_digest: "TTTT" },
	{ username: "Carson",  password_digest: "CCCC" },
	{ username: "Clinton", password_digest: "CCCC" }
]
Profile.create! [
	{ first_name: "Carly",   last_name: "Fiorina", birth_year: 1954, gender: "female" },
	{ first_name: "Donald",  last_name: "Trump",   birth_year: 1946, gender: "male"   },
	{ first_name: "Ben",     last_name: "Carson",  birth_year: 1951, gender: "male"   },
	{ first_name: "Hillary", last_name: "Clinton", birth_year: 1947, gender: "female" }
]

User.all.to_a.each do |user| 
	profile = Profile.find_by(last_name: user.username)
	user.profile = profile
	todolist = TodoList.create(list_name: "#{user.username}'s list", list_due_date: Date.today + 1.year)
	todolist.todo_items	<< TodoItem.create(title: "#{user.username}-1", due_date: Date.today + 1.year, description: "#{user.username}-1", completed: false )
	todolist.todo_items	<< TodoItem.create(title: "#{user.username}-2", due_date: Date.today + 1.year, description: "#{user.username}-2", completed: false )
	todolist.todo_items	<< TodoItem.create(title: "#{user.username}-3", due_date: Date.today + 1.year, description: "#{user.username}-3", completed: false )
	todolist.todo_items	<< TodoItem.create(title: "#{user.username}-4", due_date: Date.today + 1.year, description: "#{user.username}-4", completed: false )
	todolist.todo_items	<< TodoItem.create(title: "#{user.username}-5", due_date: Date.today + 1.year, description: "#{user.username}-5", completed: false )
	user.todo_lists << todolist
end
