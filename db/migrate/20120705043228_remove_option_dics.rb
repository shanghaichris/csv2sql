class RemoveOptionDics < ActiveRecord::Migration
  def up
    drop_table :option_dics
  end

  def down
    create_table :option_dics do |t|
      t.integer :question_id
      t.string :question
      t.integer :option_id
      t.string :option

      t.timestamps
    end
  end
end
