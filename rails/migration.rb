# JUST ADD 2 Columns
class AddNameAndEmailToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string, unique: true, null: false
    add_column :users, :email, :string, after: name, default: "user@gmail.com"
  end
end

# RENAME COLUMN
class RenameNameWithFnameToUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :name, :fname
  end
end

# UP & DOWN EXAMPLE
class AddGenderToUsers < ActiveRecord::Migration[5.1]
  def up
    add_column :users, :gender, :string
  end
  
  def down
    remove_column :users, :gender
  end
end

# CREATE TABLE
class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      
      # for t.created_at, t.updated_at, use:
      t.timestamps 
    end
  end
end

