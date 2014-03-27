class AddSurveyIdToTakers < ActiveRecord::Migration
  def change
    add_column :takers, :survey_id, :integer
  end
end
