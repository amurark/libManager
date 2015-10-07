# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
Book.create(ISBN: 001, Title: 'Intro to Algos', Authors: 'cormen', Description: 'algorithms basics', Status: 0, Lastuser: "null")
Book.create(ISBN: 002, Title: 'Fundementals of AI', Authors: 'Peter Norvig', Description: 'Basics of Artificial Intelligence', Status: 1, Lastuser: 'fgh@gmail.com')
Book.create(ISBN: 003, Title: 'OOD Programming', Authors: 'Allen Solly', Description: 'Step by Step OOD Programming', Status: 1, Lastuser: 'def@gmail.com')
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

