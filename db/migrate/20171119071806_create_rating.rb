class CreateRating < ActiveRecord::Migration[5.1]
  def up
  create_table :ratings do |t|
      t.integer "stylist_id"
      t.integer "client_id"
      t.date "date_of_appointment", :default => Time.now
      t.string "style_id"
      t.float "rating_1", :default => 0.0
      t.float "rating_2", :default => 0.0
      t.float "rating_3", :default => 0.0
      t.float "rating_4", :default => 0.0
      t.float "rating_5", :default => 0.0
      t.float "total_rating", :default => 0.0
      t.boolean "return"
      t.boolean "recommend"
      t.text "Comment"
    end

  add_index("ratings", ["stylist_id", "client_id", "style_id"])

  end


  def down
    drop_table :ratings
  end
end
