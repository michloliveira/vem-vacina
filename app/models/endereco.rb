class Endereco < ApplicationRecord
  belongs_to :usuario

  validates :cep,presence: true,length: {minimum:7}
  validates :cidade,presence: true
  validates :bairro,presence: true
  validates :logradouro,presence: true
end
