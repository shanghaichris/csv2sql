class CreateT1s < ActiveRecord::Migration
  def change
    create_table :t_1s do |t|
      t.integer :o_id
      t.integer :area
      t.boolean :o_0101
      t.boolean :o_0102
      t.boolean :o_0103
      t.boolean :o_0104
      t.boolean :o_0201
      t.boolean :o_0202
      t.boolean :o_0203
      t.boolean :o_0204
      t.boolean :o_0301
      t.boolean :o_0302
      t.boolean :o_0303
      t.boolean :o_0304
      t.boolean :o_0305
      t.boolean :o_0306
      t.boolean :o_0401
      t.boolean :o_0402
      t.boolean :o_0403
      t.boolean :o_0404
      t.boolean :o_0405
      t.boolean :o_0501
      t.boolean :o_0502
      t.boolean :o_0503
      t.boolean :o_0504
      t.boolean :o_0505
      t.boolean :o_0506
      t.boolean :o_0601
      t.boolean :o_0602
      t.boolean :o_0603
      t.boolean :o_0604
      t.boolean :o_0605
      t.boolean :o_0606

      t.timestamps
    end
  end
end
