class ArticleController < ApplicationController
    # skip_before_action :verify_authenticity_token
    before_action :authorize_request, except: [:index ,:find ,:find_all_cat]

    def index
      articles=Article.all
      render json: articles, :include => [:author => {:except => :password_digest}, :categorys => {:only => :text}]   
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
        if @current_user.id==@article.author_id
          if params[:title]
          @article.update(title: params[:title])
          end
          if params[:text]
          @article.update(text: params[:text])
          end
          render json: @article
        else
          render html: "not authorized"
      end
    end
  
    def find_all_cat
      @temp=Article.find(params[:id])
      render json: @temp.categorys
    end

     def find
      render json: Article.find(params[:id])
     end
    

end
