get '/' do
  @categories = Category.order("name").map{|cat| cat.name}
  
  return erb :index
end

get '/category/:name' do
  @posts_in_cat = Category.find_by_name( un_underscore(params[:name]) ).posts
  @posts_in_cat = @posts_in_cat.map{|post| post }
  erb :category
end

get '/post/new' do
  erb :new_post
end

get '/post/:id' do
  @post = Post.find(params[:id])

  erb :post_detail
end


post '/post/submit' do
  # if valid_input
  #   create the post (with random key)
  #   return redirect '/post/'
  # end
  # Post.create()
  @new_post = Post.new title: params[:title], price: params[:price], 
  description: params[:description], photo_url: params[:photo], email: params[:email],
  street_address: params[:street], city: params[:city], state: params[:state], zip: params[:zip], 
  random_key: SecureRandom.hex(10), category_id: params[:category]
  if @new_post.valid?
    @new_post.save
    @random = @new_post.random_key
    @post = @new_post
    erb :post_detail
  else
    redirect 'post/new'
  end
end

get '/post/edit/:random_key' do
  @post = Post.find_by_random_key(params[:random_key])

  erb :edit
end
