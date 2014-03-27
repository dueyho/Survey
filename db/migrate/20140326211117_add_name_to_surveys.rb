class AddNameToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :name, :varchar
  end
end
