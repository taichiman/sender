class CreateSheet < ActiveRecord::Migration
  def change
    create_table :sheets do |t|
      t.string :file_name
      t.timestamps null: false
    end
  end
end
