categories = Category.create!(
  [
    { title: 'Frontend' }, 
    { title: 'Backend' }, 
    { title: 'Mobile Development' }
  ]
  )

user = User.create!(name: 'kira', e_mail: '123456')

tests = Test.create!([
  { title: 'Ruby',
    level: 1,
    category_id: categories[1].id},
  { title: 'Ruby 1',
    level: 2,
    category_id: categories[1].id,}
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
    question_id: questions[0].id },
  { body: 'PHP',
    correct: false,
    question_id: questions[0].id },
  { body: 'Backend',
    correct: true,
    question_id: questions[1].id },
  { body: 'Frontend',
    correct: false,
    question_id: questions[1].id }
  ])
