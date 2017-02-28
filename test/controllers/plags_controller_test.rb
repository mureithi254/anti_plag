require 'test_helper'

class PlagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @plag = plags(:one)
  end

  test "should get index" do
    get plags_url
    assert_response :success
  end

  test "should get new" do
    get new_plag_url
    assert_response :success
  end

  test "should create plag" do
    assert_difference('Plag.count') do
      post plags_url, params: { plag: {  } }
    end

    assert_redirected_to plag_url(Plag.last)
  end

  test "should show plag" do
    get plag_url(@plag)
    assert_response :success
  end

  test "should get edit" do
    get edit_plag_url(@plag)
    assert_response :success
  end

  test "should update plag" do
    patch plag_url(@plag), params: { plag: {  } }
    assert_redirected_to plag_url(@plag)
  end

  test "should destroy plag" do
    assert_difference('Plag.count', -1) do
      delete plag_url(@plag)
    end

    assert_redirected_to plags_url
  end
end
