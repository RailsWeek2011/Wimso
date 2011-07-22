class CreateFriendsUsersJoinTable < ActiveRecord::Migration
  def change
    create_table :friends_users, :id => false do |t|
       t.integer :user_id
       t.integer :friend_id
       
     end
     
     add_index :friends_users, [:user_id, :friend_id], :unique => true
  end

end
