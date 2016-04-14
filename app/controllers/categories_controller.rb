class CategoriesController < ApplicationController
	before_action :require_admin, except: [:index, :show]



	def index
		
	@categories = Category.paginate(page: params[:page], per_page: 5 )
	end

	def show

	end

	def new

    @category = Category.new
	end

	def create

		@category = Category.new(category_params)
		if @category.save
			flash[:success] = "Successfully created"
			redirect_to categories_path
		else

		end

	end


	private
	def category_params
	params.require(:category).permit(:name)
	end
	def require_admin
		if !logged_in? || (logged_in? and !current_user.admin?)
			flash[:danger] = "Only admins can perform"
			redirect_to categories_path
		end
	end

end