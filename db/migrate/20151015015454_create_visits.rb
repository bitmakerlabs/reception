class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :first_name
      t.string :last_name
      t.attachment :photo
      t.timestamps null: false
    end

    create_table :hosts do |t|
      t.string :first_name
      t.string :last_name
      t.string :slack_handle
      t.timestamps null: false
    end

    create_table :visits do |t|
      t.integer :visitor_id
      t.integer :host_id
      t.timestamps null: false
    end
  end
end
