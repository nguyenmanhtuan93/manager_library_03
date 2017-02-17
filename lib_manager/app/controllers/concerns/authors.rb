module Authors
  def find_author
    @author = Author.find_by id: params[:id]
    unless @author
      flash[:danger] = t "author.find-danger"
      redirect_to root_url
    end
  end
end
