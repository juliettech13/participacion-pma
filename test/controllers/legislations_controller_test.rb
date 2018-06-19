require 'test_helper'

class LegislationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @legislation = legislations(:one)
  end

  test "should get index" do
    get legislations_url
    assert_response :success
  end

  test "should get new" do
    get new_legislation_url
    assert_response :success
  end

  test "should create legislation" do
    assert_difference('Legislation.count') do
      post legislations_url, params: { legislation: {  } }
    end

    assert_redirected_to legislation_url(Legislation.last)
  end

  test "should show legislation" do
    get legislation_url(@legislation)
    assert_response :success
  end

  test "should get edit" do
    get edit_legislation_url(@legislation)
    assert_response :success
  end

  test "should update legislation" do
    patch legislation_url(@legislation), params: { legislation: {  } }
    assert_redirected_to legislation_url(@legislation)
  end

  test "should destroy legislation" do
    assert_difference('Legislation.count', -1) do
      delete legislation_url(@legislation)
    end

    assert_redirected_to legislations_url
  end
end
