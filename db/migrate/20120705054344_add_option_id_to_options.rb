class AddOptionIdToOptions < ActiveRecord::Migration
  def change
    add_column :options, :option_id, :string
  end
end
