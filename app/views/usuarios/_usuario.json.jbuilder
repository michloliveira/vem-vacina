json.extract! usuario, :id, :nome_completo, :data_nascimento, :telefone, :cpf, :nome_completo_mae, :password_digest, :email, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
