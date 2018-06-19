require 'test_helper'

class ClausesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get clauses_new_url
    assert_response :success
  end

  test "should get destroy" do
    get clauses_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get clauses_edit_url
    assert_response :success
  end

  test "should get create" do
    get clauses_create_url
    assert_response :success
  end

  test "should get update" do
    get clauses_update_url
    assert_response :success
  end

  test "should get index" do
    get clauses_index_url
    assert_response :success
  end

end
