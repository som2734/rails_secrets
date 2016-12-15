class CreateSecrets < ActiveRecord::Migration
  def change
    create_table :secrets do |t|
      t.references :user, index: true
      t.text :content

      t.timestamps null: false
    end
    add_foreign_key :secrets, :users
  end
end
