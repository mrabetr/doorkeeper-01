class Api::BookmarksController < Api::BaseController
  # before_action :authenticate_user!
  before_action :set_bookmark, only: %i[show update destroy]

  # GET /bookmarks or /bookmarks.json
  def index
    @bookmarks = Bookmark.all
    render json: { bookmarks: @bookmarks }, status: :ok
  end

  # GET /bookmarks/1 or /bookmarks/1.json
  def show
    render json: { bookmark: @bookmark }, status: :ok
  end

  # POST /bookmarks or /bookmarks.json
  def create
    @bookmark = Bookmark.new(bookmark_params)

    if @bookmark.save
      render json: { bookmark: @bookmark }, status: :created
    else
      render json: { errors: @bookmark.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bookmarks/1 or /bookmarks/1.json
  def update
    if @bookmark.update(bookmark_params)
      render json: { bookmark: @bookmark }, status: :ok
    else
      render json: { errors: @bookmark.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /bookmarks/1 or /bookmarks/1.json
  def destroy
    if @bookmark.destroy
      head :no_content
    else
      render json: { errors: @bookmark.errors }, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def bookmark_params
    params.require(:bookmark).permit(:title, :url)
  end
end
