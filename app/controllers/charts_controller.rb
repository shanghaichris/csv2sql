class ChartsController < ApplicationController
  
  
  def index
    if params[:question_id]
      id = params[:question_id]
      @question = Question.find(id)
      @answers = Hash[get_answers(@question)]
     
    end
  end
  
  def series
    @series_type = params[:series_type]
    case @series_type
    when "life"
      @questions = Question.where(id: [1,2,3,4,5,7,9,10,11,12,13,14,15,16,17])
      @series = Question.where(id: [1,2,3,4,5,6,8])
    when "work"
      @questions = Question.where(id: [18,20,21,22,23,24,25,26])
      @series = Question.where(id: [1,2,3,4,5,6,19])
    when "venture"
      @questions = Question.where(id: [27,28,29,30,31,32,33,34,35,36])
      @series = Question.where(id: [1,2,3,4,5,6,19])
    end
    
    
    if params[:series_question]
      @has_series = true
      
       #show series
        @question = Question.find(params[:original_question])
        @s_options = params[:option]

        
        @chart_option = []
        
        
        @s_options.each do |s_option|
          @s = Hash.new
          @s["name"] = Option.find_by_option_id(s_option.first).option  # for series name
          @s["data"] = get_answers(@question,s_option.first).to_a  #get etc. "0302" option as series
          
          @chart_option << @s
          
        end
        
        #@s:{"name"=>"2 个", "data"=>{"1001"=>395, ..."1002"=>581}}
        #@chart_option:[{"name"=>"option1", "data"=>[1, 2, 3]}, {"name"=>"option2", "data"=>[1, 2, 3]}] 
        
        
    elsif params[:question_id]
      @has_series = false
      #show total
      id = params[:question_id]
      @question = Question.find(id)
      @answers = Hash[get_answers(@question)]
    else
      @has_series = nil
    end
    
  end
  
  def get_options
    @options = Question.find(params[:series_question_id]).options
    render :partial => "options", :object => @options,locals: {series_question_id: params[:series_question_id],original_question_id: params[:original_question_id],series_type: params[:series_type]}
  end
  
  
  def get_total_answer_with_special_options(question,s_option_id) 
    #initialize
    table_question = find_table_question(question)
    table_option = find_table_option(s_option_id)
    total_answer_option_count = 0
    
    
    question.options.each do |option|
      answers_with_option = get_option_count(table_question,table_option,option,s_option_id)
    
      #means:  T_1.joins("inner join t_2s on t_1s.o_id = t_2s.o_id").where("t_1s.o_0101 = ? and t_2s.o_0802 = ?",true,true).count
      total_answer_option_count += answers_with_option
    end
    
    return total_answer_option_count
  end
  
  def find_table_option(s_option_id)
    
        table_option = ""
         if "01,02,03,04,05,06".include? s_option_id[0,2]
           table_option = "T_1"
         elsif "07,08,09,10,11,12,13,14,15,16,17".include? s_option_id[0,2]
           table_option = "T_2"
         elsif "18,19,20,21,22,23,24,25,26,27".include? s_option_id[0,2]
           table_option = "T_3"
         elsif "28,29,30,31,32,33,34,35,36".include? s_option_id[0,2]
           table_option = "T_4"
         end
      
      return table_option
  end
  
  def find_table_question(question)
    table_question = ""
    case question.id
    when 1..6 
     table_question = "T_1"
    when 7..17 
     table_question = "T_2"
    when 18..26 
     table_question = "T_3"
    when 27..36 
     table_question = "T_4"
    end
    return table_question
  end
  
  def  get_answers(question,s_option_id=nil)
    answers = Hash.new
    
    
    #if has another options to add series
     table_option = find_table_option(s_option_id)  if s_option_id
       
    
    #question.id means which table the question's options are
    #s_option_id means which table the additional series options are
    #so we should query the data joins 2 different tables or 1 same table.
    table_question = find_table_question(question)
    
    answer_option_count = get_total_answer_with_special_options(question,s_option_id) if s_option_id   #initial the count of total answers with special addtional option
    
    question.options.each do |option|
      
      if s_option_id
        answers_with_option = get_option_count(table_question,table_option,option,s_option_id)  #get the option count
        
        answers[option.option_id] = (answers_with_option.to_f/answer_option_count.to_f*100).round(2)   #got percent
      else
        
        answers[option.option_id]  = eval "#{table_question}.where('o_#{option.option_id} = ?',true).count"
      end
    end
     
    return answers.to_a
  end
  
  
  def get_option_count(table_question,table_option,option,s_option_id)
    if table_question == table_option
      answers_with_option = eval "#{table_question}.where('#{table_question.downcase.pluralize}.o_#{option.option_id} = ? and #{table_option.downcase.pluralize}.o_#{s_option_id} = ?',true,true).count" #count of this option with addtional option
      
    else
      answers_with_option = eval "#{table_question}.joins('inner join #{table_option.downcase.pluralize} on #{table_question.downcase.pluralize}.o_id = #{table_option.downcase.pluralize}.o_id').where('#{table_question.downcase.pluralize}.o_#{option.option_id} = ? and #{table_option.downcase.pluralize}.o_#{s_option_id} = ?',true,true).count" 
    
    #means:  T_1.joins("inner join t_2s on t_1s.o_id = t_2s.o_id").where("t_1s.o_0101 = ? and t_2s.o_0802 = ?",true,true).count
    end
    return answers_with_option
  end
end
