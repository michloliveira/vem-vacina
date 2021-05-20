class Endereco < ApplicationRecord
  belongs_to :usuario

  validates :cep,presence: true,numericality: { only_integer: true } , length: {is:8}
  validates :cidade,presence: true, length:{minimum:3}
  validates :bairro,presence: true
  validates :logradouro,presence: true
  validates :complemento,presence: true
end
