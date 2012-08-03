require 'test_helper'

module LiquidCms
  class TextBlocksControllerTest < ActionController::TestCase
    setup do
      @text_block = text_blocks(:one)
    end
  
    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:text_blocks)
    end
  
    test "should get new" do
      get :new
      assert_response :success
    end
  
    test "should create text_block" do
      assert_difference('TextBlock.count') do
        post :create, text_block: { body: @text_block.body, key: @text_block.key }
      end
  
      assert_redirected_to text_block_path(assigns(:text_block))
    end
  
    test "should show text_block" do
      get :show, id: @text_block
      assert_response :success
    end
  
    test "should get edit" do
      get :edit, id: @text_block
      assert_response :success
    end
  
    test "should update text_block" do
      put :update, id: @text_block, text_block: { body: @text_block.body, key: @text_block.key }
      assert_redirected_to text_block_path(assigns(:text_block))
    end
  
    test "should destroy text_block" do
      assert_difference('TextBlock.count', -1) do
        delete :destroy, id: @text_block
      end
  
      assert_redirected_to text_blocks_path
    end
  end
end
