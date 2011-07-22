class RunsController < ApplicationController
  # GET /runs
  # GET /runs.json
  def index
    @runs = Run.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @runs }
    end
  end

  # GET /runs/1
  # GET /runs/1.json
  def show
    @run = Run.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @run }
    end
  end

  # GET /runs/new
  # GET /runs/new.json
  def new
	  
	  @run = Run.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @run }
    end
    
  end

  # GET /runs/1/edit
  def edit
    @run = Run.find(params[:id])
  end

  # POST /runs
  # POST /runs.json
  def create
    if params[:global]
			@run = Run.create :name=> params[:name] , :anz_staf=> params[:anz_staf], :anz_eps => params[:anz_eps], :global => params[:global]
			@run.save
		else
			@run = Run.create :anz_staf=> params[:anz_staf], :anz_eps => params[:anz_eps], :global => params[:global]
			
			
			puts 
			puts 
			puts "---------------------------------------------___"
			puts 
			puts 
			@usrun = UserRun.create :user => current_user, :interval => 3, :run => @run
		end
		
  end

  # PUT /runs/1
  # PUT /runs/1.json
  def update
    @run = Run.find(params[:id])

    respond_to do |format|
      if @run.update_attributes(params[:run])
        format.html { redirect_to @run, notice: 'Run was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @run.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /runs/1
  # DELETE /runs/1.json
  def destroy
    @run = Run.find(params[:id])
    @run.destroy

    respond_to do |format|
      format.html { redirect_to runs_url }
      format.json { head :ok }
    end
  end
end
