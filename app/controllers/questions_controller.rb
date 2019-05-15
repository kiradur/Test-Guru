class QuestionsController < ApplicationController
  
  before_action :find_test, only: %i[index create new]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def new; end

  def index
    render inline: '<p>Questions:<br><%= @test.questions.pluck(:body) %></p>'
  end

  def create
    @question = @test.questions.create!(question_params)
    render plain: "Question was created: " + @question.inspect
  end

  def show
    render inline: '<p>Question:<br><%= @question.body %></p>'
  end

  def destroy
    @question.destroy
    render inline: '<p>Question <%= @question.id %> was deleted</p>'
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
