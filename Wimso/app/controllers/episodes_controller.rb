class EpisodesController < ApplicationController
  # GET /episodes
  # GET /episodes.json
  def index
    @episodes = Episode.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @episodes }
    end
  end

  # GET /episodes/1
  # GET /episodes/1.json
  def show
    @episode = Episode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @episode }
    end
  end

  # GET /episodes/new
  # GET /episodes/new.json
  def new
    @episode = Episode.new 
    @episode.run_id= params[:id].to_i

	r = Run.find params[:id]
	puts r.episodes.size

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @episode }
    end
  end

  # GET /episodes/1/edit
  def edit
    @episode = Episode.find(params[:id])
  end

  # POST /episodes
  # POST /episodes.json
  def create
    @episode = Episode.new(params[:episode])

    respond_to do |format|
	if @episode.nr != (@episode.run.episodes.size+1)
		format.html { redirect_to run_path(@episode.run), notice: 'Creation aborted. Episode Nr. was invalid.' }
	else
	      if @episode.save
		format.html { redirect_to run_path(params[:episode][:run_id]), notice: 'Episode was successfully created.' }
	      else
		format.html { redirect_to run_path @episode.run }
		format.json { render json: @episode.errors, status: :unprocessable_entity }
	      end
	    end
	end
  end

  # PUT /episodes/1
  # PUT /episodes/1.json
  def update
    @episode = Episode.find(params[:id])

    respond_to do |format|
      if @episode.update_attributes(params[:episode])
        format.html { redirect_to run_path(params[:episode][:run_id]), notice: 'Episode was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @episode.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /episodes/1
  # DELETE /episodes/1.json
  def destroy
    @episode = Episode.find(params[:id])
    @run = @episode.run
    @episode.destroy

    respond_to do |format|
      format.html { redirect_to run_path @run }
      format.json { head :ok }
    end
  end
end
