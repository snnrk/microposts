class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :url, :string
    add_column :users, :region, :string
    add_column :users, :description, :text
  end
end
