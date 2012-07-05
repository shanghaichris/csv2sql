class CreateOptionDics < ActiveRecord::Migration
  def change
    create_table :option_dics do |t|
      t.integer :question_id
      t.string :question
      t.integer :option_id
      t.string :option

      t.timestamps
    end
  end
end
