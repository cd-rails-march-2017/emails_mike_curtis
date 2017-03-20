class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.references :sender
      t.references :recipient
      t.references :message, foreign_key: true

      t.timestamps
    end
  end
end
