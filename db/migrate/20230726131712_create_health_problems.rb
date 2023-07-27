# frozen_string_literal: true

class CreateHealthProblems < ActiveRecord::Migration[6.1]
  def change
    create_table :health_problems do |t|
      t.string :name
      t.integer :degree

      t.timestamps
    end
  end
end
