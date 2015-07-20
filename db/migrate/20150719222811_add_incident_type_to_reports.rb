class AddIncidentTypeToReports < ActiveRecord::Migration
  def change
    add_column :reports, :incident_type, :string
  end
end
