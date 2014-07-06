class CreateReserves < ActiveRecord::Migration
  def change
    create_table :reserves do |t|
      t.string :name
      t.string :kana
      t.string :email
      t.integer :number
      t.datetime :date
      t.text :note

      t.timestamps
    end
  end
end
