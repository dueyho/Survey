class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.column :description, :varchar
      t.column :survey_id, :integer
    end
  end
end
