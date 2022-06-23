
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    "Hello World!"
  end

  get "/articles" do 
    @articles = Article.all

    erb :index
  end

  get "/articles/new" do
    erb :new
  end

  post "/articles" do
    @article = Article.create(params)
    redirect '/articles/' + @article.id.to_s
  end

  get "/articles/:id" do
    @article = Article.find(params[:id])
    erb :show
  end

  get "/articles/:id/edit" do
    @article = Article.find(params[:id])
    erb :edit
  end

  patch "/articles/:id" do
    @article = Article.find_by_id(params[:id])
    @article.title = params[:title]
    @article.content = params[:content]
    @article.save

    redirect '/articles/' + article.id.to_s
  end

  delete "/articles/:id" do
    Article.destroy(params[:id])
    redirect "/articles"
  end
end
