class AddNameToUsers < ActiveRecord::Migration[6.0]
  def change
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone_number, :string
  end
end
