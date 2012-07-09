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
      
       #show series
        @question = Question.find(params[:original_question])
        @s_options = params[:option]

        @s = Hash.new
        @chart_option = ""
        
        debugger
        @s_options.order("id").each do |s_option|
          @s["#{s_option.first}_name"] = Option.find_by_option_id(s_option.first).option  # for series name
          @s["#{s_option.first}_data"] = get_answers(@question,s_option.first)  #get etc. "0302" option as series
          
          @chart_option += "{name:'#{Option.find_by_option_id(s_option.first).option}',data:[]},"
        end
        
        #@s:{"0302_name"=>"2 个", "0302_data"=>{"1001"=>395, ..."1002"=>581}, "0304_name"=>"4个", "0304_data"=>{"1001"=>395, ..."1002"=>581}}
        
        
        
      
    elsif params[:question_id]
      @has_series = false
      #show total
      id = params[:question_id]
      @question = Question.find(id)
      @answers = get_answers(@question)
    else
      @has_series = nil
    end
    
  end
  
  def get_options
    @options = Question.find(params[:series_question_id]).options
    render :partial => "options", :object => @options,locals: {series_question_id: params[:series_question_id],original_question_id: params[:original_question_id]}
  end
  
  
  def  get_answers(question,s_option_id=nil)
    answers = Hash.new
    
     #if has another options to add series
      if s_option_id
         if "01,02,03,04,05,06".include? s_option_id[0,2]
           s_option = T_1.find_by_o_id(s_option_id)
         elsif "07,08,09,10,11,12,13,14,15,16,17".include? s_option_id[0,2]
           s_option = T_2.find_by_o_id(s_option_id)
         elsif "18,19,20,21,22,23,24,25,26,27".include? s_option_id[0,2]
           s_option = T_3.find_by_o_id(s_option_id)
         elsif "28,29,30,31,32,33,34,35,36".include? s_option_id[0,2]
           s_option = T_4.find_by_o_id(s_option_id)
         end


      end
    
    
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
