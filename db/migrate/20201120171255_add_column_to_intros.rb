class AddColumnToIntros < ActiveRecord::Migration[6.0]
  def change
    add_column :intros, :user_id, :integer #introsテーブルにuser_idを追加
  end
end
