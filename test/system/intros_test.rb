require "application_system_test_case"

class IntrosTest < ApplicationSystemTestCase
  setup do
    @intro = intros(:one)
  end

  test "visiting the index" do
    visit intros_url
    assert_selector "h1", text: "Intros"
  end

  test "creating a Intro" do
    visit intros_url
    click_on "New Intro"

    fill_in "Content", with: @intro.content
    fill_in "Hometown", with: @intro.hometown
    fill_in "Name", with: @intro.name
    click_on "Create Intro"

    assert_text "Intro was successfully created"
    click_on "Back"
  end

  test "updating a Intro" do
    visit intros_url
    click_on "Edit", match: :first

    fill_in "Content", with: @intro.content
    fill_in "Hometown", with: @intro.hometown
    fill_in "Name", with: @intro.name
    click_on "Update Intro"

    assert_text "Intro was successfully updated"
    click_on "Back"
  end

  test "destroying a Intro" do
    visit intros_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Intro was successfully destroyed"
  end
end
