class MakeDbRelational < ActiveRecord::Migration[5.0]
  def change
    #items
    rename_column :items, :name, :desc
    add_column :items, :list_id, :integer
    add_index :items, :list_id
    add_column :items, :user_id, :integer
    add_index :items, :user_id    

    #lists
    add_column :lists, :user_id, :integer
    add_index :lists, :user_id

    #users
    add_column :users, :password, :string

  end
end
