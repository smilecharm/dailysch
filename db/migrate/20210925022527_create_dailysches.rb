class CreateDailysches < ActiveRecord::Migration[6.1]
  def change
    create_table :dailysches do |t|
      t.date :date
      t.string :counsellor
      t.time :time
      t.string :client
      t.json :ref

      t.timestamps
    end
  end
end
