require "test_helper"

class VacinaTest < ActiveSupport::TestCase
  test "nao deve criar uma vacina sem o nome" do
    usuario = Usuario.new nome_completo: 'Alexandre Matheus Ribeiro',
    data_nascimento: '1997/10/12',
    telefone: '4735675836',
    cpf: '50468675086',
    nome_completo_mae: 'Melissa Beatriz Alana',
    password: '#$amnkww@user',
    email: 'melissabeatriz@gmail.com',
    endereco_attributes:{
      cep: '95058293',
      cidade: 'Caxias do Sul',
      bairro: 'São Cristóvão',
      logradouro: 'Rua Deputado Nadir Rosseti, 99',
      complemento: 'apartamento 4'
    }
    usuario.save
    vacina = Vacina.new nome: '',
    descricao: 'UBS São Matheus, rua jose lourenço,500',
    data: '2021/08/22',
    horario: '09:30',
    usuario_id: usuario.id
    assert_not vacina.save
  end

  test "nao deve criar uma vacina com uma data inferior a atual" do
    usuario = Usuario.new nome_completo: 'Alexandre Matheus Ribeiro',
    data_nascimento: '1997/10/12',
    telefone: '4735675836',
    cpf: '50468675086',
    nome_completo_mae: 'Melissa Beatriz Alana',
    password: '#$amnkww@user',
    email: 'melissabeatriz@gmail.com',
    endereco_attributes:{
      cep: '95058293',
      cidade: 'Caxias do Sul',
      bairro: 'São Cristóvão',
      logradouro: 'Rua Deputado Nadir Rosseti, 99',
      complemento: 'apartamento 4'
    }
    usuario.save
    vacina = Vacina.new nome: 'Covid-19',
    descricao: 'UBS São Matheus, rua jose lourenço,500',
    data: '2021/01/01',
    horario: '09:30',
    usuario_id: usuario.id
    assert_not vacina.save
  end

  test "nao deve criar uma vacina fora do horario de atendimento" do
    usuario = Usuario.new nome_completo: 'Alexandre Matheus Ribeiro',
    data_nascimento: '1997/10/12',
    telefone: '4735675836',
    cpf: '50468675086',
    nome_completo_mae: 'Melissa Beatriz Alana',
    password: '#$amnkww@user',
    email: 'melissabeatriz@gmail.com',
    endereco_attributes:{
      cep: '95058293',
      cidade: 'Caxias do Sul',
      bairro: 'São Cristóvão',
      logradouro: 'Rua Deputado Nadir Rosseti, 99',
      complemento: 'apartamento 4'
    }
    usuario.save
    vacina = Vacina.new nome: 'Covid-19',
    descricao: 'UBS São Matheus, rua jose lourenço,500',
    data: '2021/10/12',
    horario: '18:30',
    usuario_id: usuario.id
    assert_not vacina.save
  end

  test "deve criar uma vacina com todos os dados inseridos corretamentes" do
    usuario = Usuario.new nome_completo: 'Alexandre Matheus Ribeiro',
    data_nascimento: '1997/10/12',
    telefone: '4735675836',
    cpf: '50468675086',
    nome_completo_mae: 'Melissa Beatriz Alana',
    password: '#$amnkww@user',
    email: 'melissabeatriz@gmail.com',
    endereco_attributes:{
      cep: '95058293',
      cidade: 'Caxias do Sul',
      bairro: 'São Cristóvão',
      logradouro: 'Rua Deputado Nadir Rosseti, 99',
      complemento: 'apartamento 4'
    }
    usuario.save
    vacina = Vacina.new nome: 'Covid-19',
    descricao: 'UBS São Matheus, rua jose lourenço,500',
    data: '2021/10/12',
    horario: '10:00',
    usuario_id: usuario.id
    assert vacina.save
  end

end
