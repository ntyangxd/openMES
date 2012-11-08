class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.string :code
      t.string :name
      t.integer :dept_id

      t.timestamps
    end
  end
end
