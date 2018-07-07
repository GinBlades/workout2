class AddUsernameToUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :username, :string
    User.all.each_with_index do |user, idx|
      user.username = "user#{idx}"
      user.save
    end
    change_column :users, :username, :string, null: false
    add_index :users, :username, unique: true
  end

  def down
    remove_column :user, :username
  end
end
