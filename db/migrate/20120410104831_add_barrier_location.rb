class AddBarrierLocation < ActiveRecord::Migration
    def change
        add_column :statuses, :location, :string, :default => 'south'
    end
end