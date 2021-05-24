Feature: vacina
  As a usuario do sistema
  I want to agendar,visualizar e editar uma nova vacina
  So that eu nao tenho que fazer isso manualmente

Scenario: Agendar vacinacao
  Given eu estou logado no sistema vem-vacina
  And  eu entro na pagina nova vacina
  When eu preencho a vacina com um nome 'Covid', descricao 'Na rua Santos Dumont, UBS centro', data '22'/'October'/'2021' e horario '15':'45'
  And eu clico no botao criar vacina
  Then eu vejo que um agendamento de vacina com o nome 'Covid' foi criado

Scenario: Editar vacinacao
  Given eu estou logado no sistema vem-vacina
  And  existe uma agendamento com o nome 'Covid'
  When eu clico em editar um agendamento com o nome 'Covid'
  And atualizo o campo hora para '10':'00'
  Then eu vejo que a vacina com o nome 'Covid' foi atualizada

Scenario: Agendar vacinacao com descricao vazia
  Given eu estou logado no sistema vem-vacina
  And  eu entro na pagina nova vacina
  When eu preencho a vacina com um nome 'Covid', descricao '', data '22'/'October'/'2021' e horario '15':'45'
  And eu clico no botao criar vacina
  Then eu vejo uma mensagem de erro

Scenario: Editar vacinacao com uma data invalida
  Given eu estou logado no sistema vem-vacina
  And  existe uma agendamento com o nome 'Covid'
  When eu clico em editar um agendamento com o nome 'Covid'
  And atualizo o campo data para '22'/'10'/'2020'
  Then eu vejo uma mensagem de erro