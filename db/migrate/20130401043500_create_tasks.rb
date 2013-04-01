class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
			t.integer	:user_id, :null => :false, :default => 0
			t.integer	:worker_id, :null => :false, :default => 0
			t.integer :project_id, :null => :false, :default => 0

			t.string :content
	
			t.integer	:done, :null => false, :default => 0

      t.timestamps
    end
  end
end
