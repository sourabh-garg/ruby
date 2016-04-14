require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase


def setup
	@category = Category.create(name: "cricket")

end

	test "should get category index" do
		get :index
		assert_response :success

	end

	test "new ctegory " do
		get :new
		assert_response :success
	end

	test "show category" do
		get(:show, {'id' => @category.id})
		assert_response :success
	end


end