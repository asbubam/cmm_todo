class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
			
			t.integer		:user_id, :null => false
			t.string 		:title

      t.timestamps
    end
  end
end
