class Question < ActiveRecord::Base
  attr_accessible :question, :multi_check
  
  has_many :options,dependent: :destroy
end
