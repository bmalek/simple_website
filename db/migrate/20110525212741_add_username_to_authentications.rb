class AddUsernameToAuthentications < ActiveRecord::Migration
  def self.up
    add_column :authentications, :username, :string
  end

  def self.down
    remove_column :authentications, :username
  end
end
