class CreateUsuarios < ActiveRecord::Migration[6.1]
  def change
    create_table :usuarios do |t|
      t.string :nome_completo
      t.string :data_nascimento
      t.string :telefone
      t.string :cpf, null: false, default: '' 
      t.string :nome_completo_mae
      t.string :password_digest,null: false,default: ''
      t.string :email

      t.timestamps
    end
  end
end
