class Vacina < ApplicationRecord
    belongs_to :usuario

    validates :nome,presence: true, length: { minimum: 2}
    validates :descricao,presence: true,length: { minimum:5}
    validates_date :data,presence: true, on_or_after: lambda { Date.current }
    validates_time :horario,presence: true, between: ['8:00am', '5:00pm']
end
