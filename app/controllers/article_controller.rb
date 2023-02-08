class ArticleController < ApplicationController
    # skip_before_action :verify_authenticity_token
    before_action :authorize_request, except: [:index ,:find]

    def index
        render json: Article.all
    end

    def add
        @article = Article.create(title: params[:title],text: params[:text],author_id: params[:author_id], category_ids: params[:category_ids])
       render json: @article
      end
    

    def delete
      @article = Article.find(params[:id])
      @article.destroy
    end


    def update
        @article = Article.find(params[:id])
        if @article.update(title: params[:title],text: params[:text], category_ids:params[:category_ids])
          render html: "Successfully updated"
        else 
          render html: "failed"
      end
    end
  
     def find
      render json: Article.find(params[:id])
     end
    

end
