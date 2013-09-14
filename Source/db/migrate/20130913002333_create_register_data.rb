class CreateRegisterData < ActiveRecord::Migration
  def change
    create_table :register_data do |t|
      t.string :name
      t.string :year
      t.string :major
      t.string :mobile
      t.string :email

      t.timestamps
    end
  end
end
