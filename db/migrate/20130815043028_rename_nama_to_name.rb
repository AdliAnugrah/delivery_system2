class RenameNamaToName < ActiveRecord::Migration
  def up
  		rename_column :categories, :nama , :name
  end

  def down
  	rename_column :categories, :name , :nama
  end
end
