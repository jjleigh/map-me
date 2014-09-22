class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
    	t.string   "name"
	    t.string   "location"
	    t.string   "latitude"
	    t.string   "longitude"
	    t.integer  "user_id"
	    t.string   "avatar"
	    t.string   "user_name"
      t.timestamps
    end
  end
end
