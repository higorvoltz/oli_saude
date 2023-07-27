# frozen_string_literal: true

class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.datetime :birthdate
      t.string :sex
      t.references :health_problem, null: false, foreign_key: true

      t.timestamps
    end
  end
end
