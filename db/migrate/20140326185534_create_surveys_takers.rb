class CreateSurveysTakers < ActiveRecord::Migration
  def change
    create_table :surveys_takers do |t|
      t.column :survey_id, :integer
      t.column :taker_id, :integer

      t.timestamps
    end
  end
end
