class AddTrackerTypeToSpreeTrackers < SolidusSupport::Migration[4.2]
  def up
    unless column_exists?(:spree_trackers, :tracker_type)
      add_column :spree_trackers, :tracker_type, :string
    end
  end

  def down
    if column_exists?(:spree_trackers, :tracker_type)
      remove_column :spree_trackers, :tracker_type
    end
  end
end
