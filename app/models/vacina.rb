class Vacina < ApplicationRecord
    belongs_to :usuario

    validates :nome,presence: true, length: { minimum: 2}
    validates :descricao,presence: true,length: { minimum:5}
end
