class CreateAssignments < ActiveRecord::Migration
  def self.up
    create_table :assignments do |t|
      t.integer :user_id
      t.integer :role_id
      t.datetime :created_at
      t.datetime :expires_on

      t.timestamps
    end
  end

  def self.down
    drop_table :assignments
  end
end
