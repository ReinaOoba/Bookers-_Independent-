class RemoveIntroduceFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :introduce, :string
  end
end
