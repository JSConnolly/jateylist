helpers do
  def select_cat
    @categories = Category.order("name").map{|cat| cat}
  end
end
