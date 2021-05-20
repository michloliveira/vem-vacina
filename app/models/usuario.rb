class Usuario < ApplicationRecord
    has_many :vacinas
    has_one :endereco

    has_secure_password
    validates :nome_completo,presence: true,length: {minimum:1, maximum:30}
    validates :password,length: {minimum:5}
    validates :email,presence: true,length: {maximum:100}

    accepts_nested_attributes_for :endereco, update_only: true
end
