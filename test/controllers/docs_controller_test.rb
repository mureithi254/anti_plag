require 'test_helper'

class DocsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get docs_index_url
    assert_response :success
  end

  test "should get new" do
    get docs_new_url
    assert_response :success
  end

  test "should get create" do
    get docs_create_url
    assert_response :success
  end

  test "should get destroy" do
    get docs_destroy_url
    assert_response :success
  end

end
