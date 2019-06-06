
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = Category.create!(
  [
    { title: 'Frontend' }, 
    { title: 'Backend' }, 
    { title: 'Mobile Development' }
  ]
  )


tests = Test.create!([
  { title: 'Ruby',
    level: 1,
    category_id: categories[1].id},
  { title: 'Ruby 1',
    level: 2,
    category_id: categories[1].id}
  ])

questions = Question.create!([
  { body: 'What programming language are you studying?',
    test_id: tests[0].id },
  { body: 'This programming language belongs to which category?',
    test_id: tests[0].id }
  ])

answers = Answer.create!([
  { body: 'Ruby', 
    correct: true,
    question_id: 1 },
  { body: 'PHP',
    correct: false,
    question_id: 1 },
  { body: 'Backend',
    correct: true,
    question_id: 2 },
  { body: 'Frontend',
    correct: false,
    question_id: 2 }
  ])
