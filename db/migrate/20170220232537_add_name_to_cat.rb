class AddNameToCat < ActiveRecord::Migration[5.0]
  def change
    add_column :cats, :name, :string
  end
end
