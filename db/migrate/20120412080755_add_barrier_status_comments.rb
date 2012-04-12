class AddBarrierStatusComments < ActiveRecord::Migration
    def change
        add_column :statuses, :comments, :text
    end
end
