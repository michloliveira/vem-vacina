Given ('eu estou logado no sistema vem-vacina') do
    visit '/usuarios/new'
    fill_in 'usuario_nome_completo',	with: 'Michel Tavares de Oliveira'
    select '1997', from: 'usuario_data_nascimento_1i'
    select 'October', from: 'usuario_data_nascimento_2i'
    select '12', from: 'usuario_data_nascimento_3i'
    fill_in 'usuario_telefone',	with: '37371010'
    fill_in 'usuario_cpf',	    with: '12678721442'
    fill_in 'usuario_nome_completo_mae',	with: 'Sueli Regina Tavares'
    fill_in 'usuario_password',	with: '12345678'
    fill_in 'usuario_email',	with: 'michel@gmail.com'
    fill_in 'usuario_endereco_attributes_cep',    with: '55680000'
    fill_in 'usuario_endereco_attributes_cidade',    with: 'Bonito'
    fill_in 'usuario_endereco_attributes_bairro',    with: 'Vila da Cohab'
    fill_in 'usuario_endereco_attributes_logradouro',    with: 'Rua Dr. Elizio Soares, 174'
    fill_in 'usuario_endereco_attributes_complemento',    with: 'Casa'
    click_on 'Create Usuario'
    visit '/entrar'
    fill_in 'session_cpf',     with: '12678721442'
    fill_in 'session_password',    with: '12345678'
    click_on 'Entrar'
end
And  ('eu entro na pagina nova vacina') do
    visit '/vacinas/new'
end
When('eu preencho a vacina com um nome {string}, descricao {string}, data {string}\/{string}\/{string} e horario {string}:{string}') do |string, string2, string3, string4, string5, string6, string7|
    fill_in 'vacina_nome',	with: string
    fill_in 'vacina_descricao',	with: string2
    select string3, :from => 'vacina_data_3i' #dia
    select string4, :from => 'vacina_data_2i' #mes
    select string5, :from => 'vacina_data_1i' #ano
    select string6, from: 'vacina_horario_4i' #hora
    select string7, from: 'vacina_horario_5i' #minutos
end
And ('eu clico no botao criar vacina')do
    click_on 'Create Vacina'
end
Then('eu vejo que um agendamento de vacina com o nome {string} foi criado') do |string|
    expect(page).to have_content(string)
end