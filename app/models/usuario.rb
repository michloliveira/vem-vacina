class Usuario < ApplicationRecord
    has_many :vacinas
    has_one :endereco

    has_secure_password
    VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

    validates :nome_completo,presence: true,length: {maximum:30}
    validates_date :data_nascimento,presence: true, on_or_before: lambda { Date.current }
    validates :telefone, presence: true, numericality: { only_integer: true } ,length: {minimum: 8}
    validates :cpf, presence: true, numericality: { only_integer: true } , length: {is:11}, uniqueness: true
    validates :nome_completo_mae, presence:true
    validates :password,length: {minimum:8}
    validates :email, presence: true, length:{maximum: 255}, format:{with: VALID_EMAIL_REGEX}, uniqueness:{case_sensitive: true}
    
    accepts_nested_attributes_for :endereco, update_only: true
end
