module Categories
  def find_category
    @category = Category.find_by id: params[:id]
    unless @category
      flash[:danger] = t "category.find-danger"
      redirect_to root_url
    end
  end
end
