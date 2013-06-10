class AddPublishedToLists < ActiveRecord::Migration
  def change
    add_column :lists, :published, :boolean, :default => false
  end
end
