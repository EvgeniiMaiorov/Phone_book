class CreateEmailAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :email_addresses do |t|
      t.string     :value
      t.references :person, index: true, foreign_key: true
      t.timestamps
    end
  end
end
