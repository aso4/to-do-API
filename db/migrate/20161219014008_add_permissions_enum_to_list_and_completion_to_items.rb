class AddPermissionsEnumToListAndCompletionToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :lists, :permissions, :integer

    add_column :items, :completed, :boolean
  end
end
