module Api
  module V1
    class ArticlesController < ApplicationController

      def index
        articles = Article.order('created_at DESC')
        render json: {status: 'SUCCESS', message: 'Loaded articles from index action', date:articles}, status: :ok
      end

      def show
        article = Article.find( params[:id])
        render json: {status: 'SUCCESS', message: 'Loaded article from show action', date:article}, status: :ok
      end

      def create
       article = Article.new(article_params)
        if article.save
          render json: {status: 'SUCCESS', message: 'Created article successfully', date:article}, status: :ok
        else
          render json: {status: 'ERROR', message: 'Failed to create article ', date:article.errors}, status: :unprocessable_entity
        end
      end

      private

      def article_params
        params.permit(:title, :body)
      end

    end
  end
end

