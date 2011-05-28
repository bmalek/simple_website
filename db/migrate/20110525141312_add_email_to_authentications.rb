class AddEmailToAuthentications < ActiveRecord::Migration
  def self.up
    add_column :authentications, :provider_email, :string
  end

  def self.down
    remove_column :authentications, :provider_email
  end
end
