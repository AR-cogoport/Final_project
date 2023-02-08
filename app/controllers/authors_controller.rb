class AuthorsController < ApplicationController
    # skip_before_action :verify_authenticity_token
    before_action :authenticate_request, except: [:add,:index, :find_articles_by_author]
    before_action :set_user, only: [:update, :delete]
    
     def index
        render json: Author.all
     end

     def add
         c=Author.create(name: params[:name],bio: params[:bio],email: params[:email],password:params[:password],password_confirmation:params[:password_confirmation])
         render json: c
     end
     
     def update
        if Author.update(name: params[:name],bio: params[:bio],email: params[:email])
            render html: "profile updated susccessfully"
        else render html: "failed to update"
        end
    end

    def delete
        @delete=Author.find(params[:id])
        @delete.destroy
    end
   
    def set_user
        @author =Author.find(params[:id])
    end

   
    def find_articles_by_author
        @author=Author.find(params[:id])
        # @article=Article.where(author_id: @author.id)
       render json: @author.articles
    end
end
