class CreateSections < ActiveRecord::Migration
  def up
    create_table :sections do |t|
      t.integer "page_id"
	    t.string "name" 
      t.integer "position" 
      t.boolean "visible"  ,:default=>false
      t.string "context_text"
      t.text "context"
      t.timestamps
    end
    add_index("sections","page_id")
  end

  def down
    drop_table :sections
  end
end
