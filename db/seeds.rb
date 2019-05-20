
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = Category.create!([{ title: 'Category 1' }])

tests = Test.create!([{ title: 'Test 1', level: 0, category_id: categories.first },
                     { title: 'Test 2', level: 1, category_id: categories.first },
                     { title: 'Test 3', level: 1, category_id: categories.first },
                     { title: 'Test 4', level: 2, category_id: categories.first }])

questions = Question.create!([{ body: 'Question 1', test_id: tests.first },
                             { body: 'Question 2', test_id: tests.first },
                             { body: 'Question 3', test_id: tests.first },
                             { body: 'Question 4', test_id: tests.first }])

answers = Answer.create!([{ body: 'Answer 1', correct: false, question_id: questions.first },
                         { body: 'Answer 2', correct: true, question_id: questions.first },
                         { body: 'Answer 3', correct: false, question_id: questions.first },
                         
                         { body: 'Answer 1', correct: true, question_id: questions[1] }, 
                         { body: 'Answer 2', correct: false, question_id: questions[1] },
                         { body: 'Answer 3', correct: false, question_id: questions[1] },
                         
                         { body: 'Answer 1', correct: false, question_id: questions[2] },
                         { body: 'Answer 2', correct: false, question_id: questions[2] },
                         { body: 'Answer 3', correct: true, question_id: questions[2] },

                         { body: 'Answer 1', correct: true, question_id: questions.last },
                         { body: 'Answer 2', correct: false, question_id: questions.last },
                         { body: 'Answer 3', correct: false, question_id: questions.last }])
