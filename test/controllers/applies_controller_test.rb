require 'test_helper'

class AppliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @apply = applies(:one)
  end

  test "should get index" do
    get applies_url
    assert_response :success
  end

  test "should get new" do
    get new_apply_url
    assert_response :success
  end

  test "should create apply" do
    assert_difference('Apply.count') do
      post applies_url, params: { apply: { last_word: @apply.last_word, question1_radio: @apply.question1_radio, question1_str: @apply.question1_str, question2_radio: @apply.question2_radio, question2_str: @apply.question2_str, question3_radio: @apply.question3_radio, question3_str: @apply.question3_str, question4_radio: @apply.question4_radio, question4_str: @apply.question4_str, question5_str: @apply.question5_str } }
    end

    assert_redirected_to apply_url(Apply.last)
  end

  test "should show apply" do
    get apply_url(@apply)
    assert_response :success
  end

  test "should get edit" do
    get edit_apply_url(@apply)
    assert_response :success
  end

  test "should update apply" do
    patch apply_url(@apply), params: { apply: { last_word: @apply.last_word, question1_radio: @apply.question1_radio, question1_str: @apply.question1_str, question2_radio: @apply.question2_radio, question2_str: @apply.question2_str, question3_radio: @apply.question3_radio, question3_str: @apply.question3_str, question4_radio: @apply.question4_radio, question4_str: @apply.question4_str, question5_str: @apply.question5_str } }
    assert_redirected_to apply_url(@apply)
  end

  test "should destroy apply" do
    assert_difference('Apply.count', -1) do
      delete apply_url(@apply)
    end

    assert_redirected_to applies_url
  end
end
