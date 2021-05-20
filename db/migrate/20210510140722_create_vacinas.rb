class CreateVacinas < ActiveRecord::Migration[6.1]
  def change
    create_table :vacinas do |t|
      t.string :nome
      t.text :descricao
      t.date :data
      t.time :horario

      t.timestamps
    end
  end
end
