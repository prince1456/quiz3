class AddAvatarsToIdeas < ActiveRecord::Migration[5.0]
  def change
    add_column :ideas, :avatars, :json
  end
end
