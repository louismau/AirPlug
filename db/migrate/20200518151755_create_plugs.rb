class CreatePlugs < ActiveRecord::Migration[6.0]
  def change
    create_table :plugs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :address
      t.float :price
      t.float :power
      t.string :ac_dc
      t.string :type_plug

      t.timestamps
    end
  end
end
