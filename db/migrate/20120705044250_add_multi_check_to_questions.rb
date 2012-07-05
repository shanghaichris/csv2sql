class AddMultiCheckToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :multi_check, :boolean
  end
end
