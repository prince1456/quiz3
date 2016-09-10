class AddPictureToIdeas < ActiveRecord::Migration[5.0]
  def change
    add_column :ideas, :picture, :string
  end
end
