class RemoveEnvironmentToSpreeTrackers < SolidusSupport::Migration[4.2]
  def up
    if column_exists?(:spree_trackers, :environment)
      remove_column :spree_trackers, :environment
    end
  end

  def down
    unless column_exists?(:spree_trackers, :environment)
      add_column :spree_trackers, :environment, :string
    end
  end
end
