class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :user_id
      t.string :title
      t.string :string
      t.string :file
      t.string :string
      t.string :created_at
      t.string :datetime

      t.timestamps null: false
    end
  end
end
