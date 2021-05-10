class Usuario < ApplicationRecord
    has_secure_password
    validates :nome_completo,presence: true,length: {minimum:1, maximum:30}
    validates :password_digest,length: {minimum:6}
    validates :email,presence: true,length: {maximum:100}
end
