class AddPhotoFields < ActiveRecord::Migration
    def change
        add_column :statuses, :photo_file_name,    :string
	    add_column :statuses, :photo_content_type, :string
	    add_column :statuses, :photo_file_size,    :integer
	    add_column :statuses, :photo_updated_at,   :datetime
    end
end
