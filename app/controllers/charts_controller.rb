class ChartsController < ApplicationController
  
  
  def index
    if params[:question_id]
      id = params[:question_id]
      @question = Question.find(id)
      @answers = get_answers(@question)
     
    end
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
    when 18..27 
      question.options.each do |option|
        answers[option.option_id] = T_3.where("o_#{option.option_id} = ?",true).count
      end
    when 28..36 
      question.options.each do |option|
        answers[option.option_id] = T_4.where("o_#{option.option_id} = ?",true).count
      end
    end
    
    return answers
  end
end
