class SearchesController < ApplicationController
  before_action :authenticate_user!

	def search
		@model = params[:model]
		@content = params[:content]
		@method = params[:method]
		if @method == "perfect"
			@method_word = "完全一致"
		elsif @method == "forward"
			@method_word = "前方一致"
		elsif @method == "backward"
			@method_word = "後方一致"
		else
			@method_word = "部分一致"
		end

		if @model == 'user'
			@records = User.search_for(@content, @method)
		else
			@records = Book.search_for(@content, @method)
		end
	end
end
