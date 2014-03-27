class DropColumnTakeridFromSurveys < ActiveRecord::Migration
  def self.up
    remove_column :surveys, :taker_id, :integer
  end
end
