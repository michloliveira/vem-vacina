require "application_system_test_case"

class UsuariosTest < ApplicationSystemTestCase
  setup do
    @usuario = usuarios(:one)
  end

  test "visiting the index" do
    visit usuarios_url
    assert_selector "h1", text: "Usuarios"
  end

  test "creating a Usuario" do
    visit usuarios_url
    click_on "New Usuario"

    fill_in "Cpf", with: @usuario.cpf
    fill_in "Data nascimento", with: @usuario.data_nascimento
    fill_in "Email", with: @usuario.email
    fill_in "Nome completo", with: @usuario.nome_completo
    fill_in "Nome completo mae", with: @usuario.nome_completo_mae
    fill_in "Password digest", with: @usuario.password_digest
    fill_in "Telefone", with: @usuario.telefone
    click_on "Create Usuario"

    assert_text "Usuario was successfully created"
    click_on "Back"
  end

  test "updating a Usuario" do
    visit usuarios_url
    click_on "Edit", match: :first

    fill_in "Cpf", with: @usuario.cpf
    fill_in "Data nascimento", with: @usuario.data_nascimento
    fill_in "Email", with: @usuario.email
    fill_in "Nome completo", with: @usuario.nome_completo
    fill_in "Nome completo mae", with: @usuario.nome_completo_mae
    fill_in "Password digest", with: @usuario.password_digest
    fill_in "Telefone", with: @usuario.telefone
    click_on "Update Usuario"

    assert_text "Usuario was successfully updated"
    click_on "Back"
  end

  test "destroying a Usuario" do
    visit usuarios_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Usuario was successfully destroyed"
  end
end
