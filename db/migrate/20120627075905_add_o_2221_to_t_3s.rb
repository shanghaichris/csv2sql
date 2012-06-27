class AddO2221ToT3s < ActiveRecord::Migration
  def change
    add_column :t_3s, :o_2221, :boolean
  end
end
