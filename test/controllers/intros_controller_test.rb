require 'test_helper'

class IntrosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @intro = intros(:one)
  end

  test "should get index" do
    get intros_url
    assert_response :success
  end

  test "should get new" do
    get new_intro_url
    assert_response :success
  end

  test "should create intro" do
    assert_difference('Intro.count') do
      post intros_url, params: { intro: { content: @intro.content, hometown: @intro.hometown, name: @intro.name } }
    end

    assert_redirected_to intro_url(Intro.last)
  end

  test "should show intro" do
    get intro_url(@intro)
    assert_response :success
  end

  test "should get edit" do
    get edit_intro_url(@intro)
    assert_response :success
  end

  test "should update intro" do
    patch intro_url(@intro), params: { intro: { content: @intro.content, hometown: @intro.hometown, name: @intro.name } }
    assert_redirected_to intro_url(@intro)
  end

  test "should destroy intro" do
    assert_difference('Intro.count', -1) do
      delete intro_url(@intro)
    end

    assert_redirected_to intros_url
  end
end
