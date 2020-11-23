class AddNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string #:usersは何を表しとるん？->usersテーブル
  end
end
