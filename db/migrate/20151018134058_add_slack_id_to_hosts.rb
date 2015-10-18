class AddSlackIdToHosts < ActiveRecord::Migration
  def change
    add_column :hosts, :slack_id, :string, null: false
    add_index :hosts, :slack_id, unique: true

    reversible do |dir|
      dir.up do
        rename_column :visits, :host_id, :host_slack_id
        change_column :visits, :host_slack_id, :string
      end

      dir.down do
        rename_column :visits, :host_slack_id, :host_id
        change_column :visits, :host_id, 'integer USING CAST(host_id AS integer)'
      end
    end
  end
end
