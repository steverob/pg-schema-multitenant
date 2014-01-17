require 'test_helper'

class MetaDataControllerTest < ActionController::TestCase
  setup do
    @meta_datum = meta_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:meta_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create meta_datum" do
    assert_difference('MetaDatum.count') do
      post :create, meta_datum: { account_id: @meta_datum.account_id, field_name: @meta_datum.field_name, table_name: @meta_datum.table_name }
    end

    assert_redirected_to meta_datum_path(assigns(:meta_datum))
  end

  test "should show meta_datum" do
    get :show, id: @meta_datum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @meta_datum
    assert_response :success
  end

  test "should update meta_datum" do
    patch :update, id: @meta_datum, meta_datum: { account_id: @meta_datum.account_id, field_name: @meta_datum.field_name, table_name: @meta_datum.table_name }
    assert_redirected_to meta_datum_path(assigns(:meta_datum))
  end

  test "should destroy meta_datum" do
    assert_difference('MetaDatum.count', -1) do
      delete :destroy, id: @meta_datum
    end

    assert_redirected_to meta_data_path
  end
end
