class Contact < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
    end
    
    add_reference :contacts, :sheet

  end
end

