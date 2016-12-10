class MakeDbRelational < ActiveRecord::Migration[5.0]
  def change
    #items
    rename_column :items, :name, :desc
    add_foreign_key :items, :lists

    #lists
    add_foreign_key :lists, :users

    #users
    add_column :users, :password, :string
  end
end
