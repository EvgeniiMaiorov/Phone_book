class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :first_name,  index: true
      t.string :last_name, index: true
      t.timestamps
    end
  end
end
