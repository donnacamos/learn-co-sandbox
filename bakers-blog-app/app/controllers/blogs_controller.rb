class Blogs < ApplicationController 
  
  # get posts/new 
  
   get '/posts/new' do 
     erb :'/posts/new' 
   end 
   
   post '/posts' do 
    raise params.inspect 
    
    
    if !logged_in
      redirect to '/'
    end 
    
    if params[:posts] != ""
      @post = Post.create(posts: params[:content], recipes: params[:recipes], user_id: current_user.id) 
      redirect to '/posts/#{@post.id}' 
    else 
      redirect to '/posts/show' 
    end 
    
    get '/posts/:id' do  
      @post = Post.find(params[:id]) 
      erb :'/posts/show'   
    end 
   end
   
     get '/posts/:id/edit' do 
       
       erb :'/posts/edit' 
     end 
   
end 