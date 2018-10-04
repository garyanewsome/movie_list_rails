class MoviesController < ApplicationController
  include HTTParty
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.all
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        unless params[:movie_list] == ''
          movie_lists_movie = MovieListsMovie.new(movie_list_id: params[:movie_list], movie_id: params[:id])
          movie_lists_movie.save
        end
        format.any { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        if @movie.movie_lists.last != params[:movie_list][:id]
          movie_lists_movie = MovieListsMovie.new(movie_list_id: params[:movie_list][:id], movie_id: params[:id])
          movie_lists_movie.save
        end
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_details
    response = HTTParty.get("http://www.omdbapi.com/?t=#{params[:title]}&apikey=55cc1c7b")
    details = response.body
    redirect_to confirm_details_movies_url(params: { details: details })
  end

  def confirm_details
    @details = JSON.parse params[:details]
  end

  def select_movie
    movie = Movie.new(
      title: params[:details]['Title'],
      year: params[:details]['Year'],
      poster_url: params[:details]['Poster'],
      genre: params[:details]['Genre']
    )
    movie.save
    redirect_to movie_path(movie)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:title, :year, :poster_url, :genre, :rating, :movie_list)
    end
end
