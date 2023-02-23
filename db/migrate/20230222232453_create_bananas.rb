class CreateBananas < ActiveRecord::Migration[7.0]
  def change
    create_table :bananas do |t|
      t.string :name
      t.string :kind

      t.timestamps
    end
  end
end
