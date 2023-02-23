require "application_system_test_case"

class BananasTest < ApplicationSystemTestCase
  setup do
    @banana = bananas(:one)
  end

  test "visiting the index" do
    visit bananas_url
    assert_selector "h1", text: "Bananas"
  end

  test "should create banana" do
    visit bananas_url
    click_on "New banana"

    fill_in "Kind", with: @banana.kind
    fill_in "Name", with: @banana.name
    click_on "Create Banana"

    assert_text "Banana was successfully created"
    click_on "Back"
  end

  test "should update Banana" do
    visit banana_url(@banana)
    click_on "Edit this banana", match: :first

    fill_in "Kind", with: @banana.kind
    fill_in "Name", with: @banana.name
    click_on "Update Banana"

    assert_text "Banana was successfully updated"
    click_on "Back"
  end

  test "should destroy Banana" do
    visit banana_url(@banana)
    click_on "Destroy this banana", match: :first

    assert_text "Banana was successfully destroyed"
  end
end
