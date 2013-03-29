class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
			
			t.integer		:user_id, :null => false, :default => 0
			t.string 		:title

      t.timestamps
    end
  end
end
