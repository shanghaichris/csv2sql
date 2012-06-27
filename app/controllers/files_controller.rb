class FilesController < ApplicationController
  require 'uuidtools'
  require 'csv'
  
  def index
    @records_counter = T_1.all.count
  end
  
  def upload
    if @filename=uploadFile(params[:file])
      #debugger
      @result = parsing(@filename)
      flash[:msg] = "file parsed!"
      redirect_to root_path
    else
      flash[:error] = "file upload failed!"
      redirect_to root_path
    end
  end
  
  def reset
    T_1.delete_all
    T_2.delete_all
    T_3.delete_all
    T_4.delete_all
    flash[:msg] = "All the data are deleted."
    redirect_to root_path
  end
  
  def reset_files
    Dir["#{Rails.root}/public/upload/*"].each {|f| File.delete(f)}  #delete all the file uploaded
    flash[:msg] = "All the files are deleted."
    redirect_to root_path
  end
  
  def result
    
  end


private
  def uploadFile(file)    
       if !file.original_filename.empty?  
         #生成一个随机的文件名      
         file_type = file.content_type
         if file_type == "text/csv"
           newfilename = UUIDTools::UUID.timestamp_create().to_s+'.csv'
         else
           newfilename = UUIDTools::UUID.timestamp_create().to_s+'.xls'
         end
         
         #向dir目录写入文件  
         #debugger
         File.open("#{Rails.root}/public/upload/#{newfilename}", "wb") do |f|   
            f.write(file.read)  
         end   
         
         #debugger
         #返回文件名称，
         return newfilename  
       end  
    end
    
    def parsing(filename)
      
      
      file_type = filename.slice(-3,3)
      
      if file_type == "csv"
        parse_csv(filename)
      else
         parse_xls(filename)
      end
    end
     
     def parse_csv(file)
       File.readlines("#{Rails.root}/public/upload/#{file}").each do |line|  

            current_row = line.chomp.split(',')

            (2..current_row.size-1).each do |i|
               question = current_row[i][0,2]  # got the question number
               answer = current_row[i][2,2]    # got the answer number


               #select the table
                if "01,02,03,04,05,06".include? question
                  record = T_1.find_or_create_by_o_id(current_row[0])
                elsif "07,08,09,10,11,12,13,14,15,16,17".include? question
                  record = T_2.find_or_create_by_o_id(current_row[0])
                elsif "18,19,20,21,22,23,24,25,26,27".include? question
                  record = T_3.find_or_create_by_o_id(current_row[0])
                elsif "28,29,30,31,32,33,34,35,36".include? question
                  record = T_4.find_or_create_by_o_id(current_row[0])
                end
                #debugger
                eval "record.o_#{current_row[i]} = true"  #set the answer to correct field
                record.area = current_row[1]
                record.save
            end
            #end of each current_row
       end
        #end of all the line
     end

     def parse_xls(file)
       File.readlines("#{Rails.root}/public/upload/#{file}").each do |line|  
       end
     end
end
