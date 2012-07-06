class ChartsController < ApplicationController
  
  
  def index
    if params[:question_id]
      id = params[:question_id]
      @question = Question.find(id)
      @answers = get_answers(@question)
     
    end
  end
  
  def life
    @questions = Question.where(id: [7,9,10,11,12,13,14,15,16,17])
    @series = Question.where(id: [1,2,3,4,5,6,8])
    if params[:question_id]
      id = params[:question_id]
      @question = Question.find(id)
      @answers = get_answers(@question)
    end
  end
  
  def get_options
    @options = Question.find(params[:series_question_id]).options
    render :partial => "options", :object => @options,locals: {series_question_id: params[:series_question_id],original_question_id: params[:original_question_id]}
  end
  
  
  def add_series
    
  end
  
  def  get_answers(question)
    answers = Hash.new
    case question.id
    when 1..6 
      question.options.each do |option|
        answers[option.option_id] = T_1.where("o_#{option.option_id} = ?",true).count
      end
        
    when 7..17 
      question.options.each do |option|
        answers[option.option_id] = T_2.where("o_#{option.option_id} = ?",true).count
      end
    when 18..26 
      question.options.each do |option|
        answers[option.option_id] = T_3.where("o_#{option.option_id} = ?",true).count
      end
    when 27..36 
      question.options.each do |option|
        answers[option.option_id] = T_4.where("o_#{option.option_id} = ?",true).count
      end
    end
    
    return answers
  end
end
