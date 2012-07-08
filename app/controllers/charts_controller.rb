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
    
    
    if params[:series_question]
      @has_series = true
    else
      @has_series = false
    end
    
    unless @has_series
      #show total
      id = params[:question_id]
      @question = Question.find(id)
      @answers = get_answers(@question)
    else
      #show series
      @question = Question.find(params[:original_question])
      @s_options = params[:option]
      
      @s = Hash.new
      debugger
      @s_options.each do |s_option|
        @s["#{s_option.first}_name"] = Option.find_by_option_id(s_option.first).option  # for series name
        @s["#{s_option.first}_data"] = get_answers(@question,s_option.first)  #get etc. "0302" option as series
      end
    end
  end
  
  def get_options
    @options = Question.find(params[:series_question_id]).options
    render :partial => "options", :object => @options,locals: {series_question_id: params[:series_question_id],original_question_id: params[:original_question_id]}
  end
  
  
  def  get_answers(question,s_option=nil)
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
