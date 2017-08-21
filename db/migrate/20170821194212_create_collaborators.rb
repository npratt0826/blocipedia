class CreateCollaborators < ActiveRecord::Migration
  def change_table
 
     add_index :wikis, :id, unique: true
     add_index :users, :id, unique: true
     add_index :collaborators, :id, unique: true
     add_index :collaborators, :wiki_id
     add_index :collaborators, :user_id
  end
end
