class ChartsController < ApplicationController
  
  
  def index
    @question = Question.find(params[:question_id]) if params[:question_id]
  end
end
