class CreatePromotions < ActiveRecord::Migration[5.0]
  def change
    create_table :promotions do |t|
      t.string :diploma_year

      t.timestamps
    end
  end
end
