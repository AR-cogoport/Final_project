class CategoryController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authorize_request, except: :index

    def index
        render json: Category.all
    end

    def add
        @category = Category.create(text: params[:text])
        render json: @category
    
    end
    

    #   def update
    #     @category = Category.find(params[:id])
    #     if @category.update(text: params[:text])
    #       render html: 'category was successfully updated!'
    #     else
    #     render html: 'category failed to be updated.'
    #     end
    #   end

      def delete
        Category.find(params[:id]).destroy
      end

end
