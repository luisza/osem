class AddTextareaToQanswersRegistrations < ActiveRecord::Migration
  def change
    add_column :qanswers_registrations, :textarea, :text
  end
end
