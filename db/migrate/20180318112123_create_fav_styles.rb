class CreateFavStyles < ActiveRecord::Migration[5.1]
    def up
      create_table :fav_styles, :id => false do |t|
        t.integer "client_id"
        t.integer "style_id"
      end
        add_index("fav_styles", ["client_id", "style_id"])
    end


    def down
      drop_table :fav_styles
    end
end
