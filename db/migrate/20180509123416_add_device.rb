class AddDevice < ActiveRecord::Migration[5.1]
  def change
    create_table :devices do |t|
      t.string :token, null: false, index: true
      t.belongs_to :user
      t.timestamps
    end
  end
end
