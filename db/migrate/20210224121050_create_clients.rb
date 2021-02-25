class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :identificationId
      t.string :documentType
      t.string :phoneNumber
      t.string :fixedNumber
      t.datetime :birthDate
      t.datetime :expeditionDate
      t.string :contractType
      t.integer :salary
      t.datetime :entryDate
      t.string :profession
      t.string :genus

      t.timestamps
    end
  end
end
