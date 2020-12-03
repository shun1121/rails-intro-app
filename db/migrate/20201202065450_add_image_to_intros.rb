class AddImageToIntros < ActiveRecord::Migration[6.0]
  def change
    add_column :intros, :image, :string
  end
end
