class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.column :question_id, :integer
      t.column :taker_id, :integer
    end
  end
end
