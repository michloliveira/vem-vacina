require "test_helper"

class UsuarioTest < ActiveSupport::TestCase
  test "nao deve criar um usuario sem o nome completo" do
    usuario = Usuario.new nome_completo: '',
      data_nascimento: '1981/10/15',
      telefone: '6837838404',
      cpf: '15217491833',
      nome_completo_mae: 'Alana Simone Gabriela',
      password: '%$dskjn4320',
      email: 'hheloisabiancadaconceicao@gmail.com',
      endereco_attributes:{
        cep: '69906083',
        cidade: 'Rio de Janeiro',
        bairro: 'Divinópoles',
        logradouro: 'Rua monteiro lobato, 128',
        complemento: 'apartamento'
      }
    assert_not usuario.save
  end
  
  test "nao deve criar um usuario com o a senha menor que 8 digitos" do
    usuario = Usuario.new nome_completo: 'Caroline Vitória Cardoso',
      data_nascimento: '1999/2/25',
      telefone: '6337908606',
      cpf: '45655372657',
      nome_completo_mae: 'Giovana Cláudia Cardoso',
      password: '#$10aA',
      email: 'carolinevitoriacardoso_@hotmail.com',
      endereco_attributes:{
        cep: '77019038',
        cidade: 'Palmas',
        bairro: 'Plano Diretor Sul',
        logradouro: 'Quadra 1103 Sul Alameda , 256',
        complemento: 'casa'
      }
    assert_not usuario.save
  end

  test "nao deve criar um usuario com um email invalido" do
    usuario = Usuario.new nome_completo: 'Giovanna Sophie Novaes',
      data_nascimento: '2004/11/01',
      telefone: '6928385758',
      cpf: '48592130760',
      nome_completo_mae: 'Sarah Maya Cordeiro Novaes',
      password: '$ophie#novaes!@#',
      email: 'ggiovannasophienovaes@rjnet',
      endereco_attributes:{
        cep: '76801186',
        cidade: 'Porto Velho',
        bairro: 'Arigolândia',
        logradouro: 'Rua Rui Barbosa ,512',
        complemento: 'apartamento'
      }
    assert_not usuario.save
  end

  test "deve criar um usuario com os todos os dados inseridos corretamente" do
    usuario = Usuario.new nome_completo: 'Louise Carolina Pietra da Cruz',
      data_nascimento: '1997/10/12',
      telefone: '1325377224',
      cpf: '19101988700',
      nome_completo_mae: 'Stella Flávia Laís',
      password: '$p2gmqWWx2p',
      email: 'louisecarolinapietradacruz@hotmail.com',
      endereco_attributes:{
        cep: '11349345',
        cidade: 'São Vicente',
        bairro: 'Conjunto Residencial Humaitá',
        logradouro: 'Rua João Riguero ,1024',
        complemento: 'casa'
      }
    assert usuario.save
  end
end
