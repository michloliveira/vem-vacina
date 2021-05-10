class Usuario < ApplicationRecord
    validates :nome_completo,presence: true,length: {minimum:1, maximum:30}
    validates :password,length: {minimum:6}
    validates :email,presence: true,length: {maximum:100}
    has_secure_password
end
