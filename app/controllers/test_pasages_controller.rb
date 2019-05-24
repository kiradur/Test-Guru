class TestPasagesController < ApplicationController
  before_action :set_test_pasage, only: %i[show update result]

  def show; end

  def result; end

  def update
    @test_pasage.accept!(params[:answer_ids])

    if @test_pasage.completed?
      redirect_to result_test_pasage_path(@test_pasage)
    else
      render :show
    end
  end

  private

  def set_test_pasage
    @test_pasage = TestPasage.find(params[:id])
  end
end
