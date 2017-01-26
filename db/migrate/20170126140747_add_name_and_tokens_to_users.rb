class AddNameAndTokensToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :access_token, :string
    add_column :users, :refresh_token, :string
  end
end
