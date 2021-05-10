require "application_system_test_case"

class VacinasTest < ApplicationSystemTestCase
  setup do
    @vacina = vacinas(:one)
  end

  test "visiting the index" do
    visit vacinas_url
    assert_selector "h1", text: "Vacinas"
  end

  test "creating a Vacina" do
    visit vacinas_url
    click_on "New Vacina"

    fill_in "Data", with: @vacina.data
    fill_in "Descricao", with: @vacina.descricao
    fill_in "Horario", with: @vacina.horario
    fill_in "Nome", with: @vacina.nome
    click_on "Create Vacina"

    assert_text "Vacina was successfully created"
    click_on "Back"
  end

  test "updating a Vacina" do
    visit vacinas_url
    click_on "Edit", match: :first

    fill_in "Data", with: @vacina.data
    fill_in "Descricao", with: @vacina.descricao
    fill_in "Horario", with: @vacina.horario
    fill_in "Nome", with: @vacina.nome
    click_on "Update Vacina"

    assert_text "Vacina was successfully updated"
    click_on "Back"
  end

  test "destroying a Vacina" do
    visit vacinas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vacina was successfully destroyed"
  end
end
