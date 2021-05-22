require "test_helper"

class EnderecoTest < ActiveSupport::TestCase
  test "nao deve criar um endereco sem uma cidade" do
    usuario = Usuario.new nome_completo: 'Alexandre Matheus Ribeiro',
    data_nascimento: '1997/10/12',
    telefone: '4735675836',
    cpf: '50468675086',
    nome_completo_mae: 'Melissa Beatriz Alana',
    password: '#$amnkww@user',
    email: 'melissabeatriz@gmail.com',
    endereco_attributes:{
      cep: '77019038',
      cidade: '',
      bairro: 'Boa Vista',
      logradouro: 'Rua Leonardo Raposo, 200',
      complemento: 'casa'
    }
    assert_not usuario.save
  end

  test "nao deve criar um endereco com um cep invalido" do
    usuario = Usuario.new nome_completo: 'Alexandre Matheus Ribeiro',
    data_nascimento: '1997/10/12',
    telefone: '4735675836',
    cpf: '50468675086',
    nome_completo_mae: 'Melissa Beatriz Alana',
    password: '#$amnkww@user',
    email: 'melissabeatriz@gmail.com',
    endereco_attributes:{
      cep: '49082q',
      cidade: 'Aracaju',
      bairro: 'Santos Dumont',
      logradouro: 'Rua Major Corbiniano, 20',
      complemento: 'casa'
    }
    assert_not usuario.save
  end

  test "nao deve criar um endereco sem um complemento" do
    usuario = Usuario.new nome_completo: 'Alexandre Matheus Ribeiro',
    data_nascimento: '1997/10/12',
    telefone: '4735675836',
    cpf: '50468675086',
    nome_completo_mae: 'Melissa Beatriz Alana',
    password: '#$amnkww@user',
    email: 'melissabeatriz@gmail.com',
    endereco_attributes:{
      cep: '69918114',
      cidade: 'Caxias do Sul',
      bairro: 'São Cristóvão',
      logradouro: 'Rua Deputado Nadir Rosseti, 99',
      complemento: ''
    }
    assert_not usuario.save
  end

  test "deve criar um endereco com todos os dados inseridos corretamente" do
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
    assert usuario.save
  end
end
