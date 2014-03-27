class DropColumnSurveyidFromTakers < ActiveRecord::Migration
  def self.up
    remove_column :takers, :survey_id, :integer
  end
end
