class RunsController < ApplicationController
  # GET /runs
  # GET /runs.json
  before_filter :authenticate_user!
  
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
	  if current_user.is_admin
	    @run = Run.find(params[:id])
	    else
		flash[ :alert] = "no permission"
		redirect_to run_path params[:id]
	    end    
  end

  # POST /runs
  # POST /runs.json
  def create
	@run = Run.create :name=> params[:name] ,:rating => 0, :anz_rating => 0, :anz_staf=> params[:anz_staf], :anz_eps => params[:anz_eps], :global => params[:global]
        tag = params[:tag].split(',')
	
	tf = Tag.new

	tag.each do |name|

		find = false
		if Tag.all.size != 0
			Tag.all.each do |ta|
				if ta.name == name

					find = true;
					tf = ta
		
				end
			end
		else
		  	tn = Tag.create :name => name
		end

		if find
			@run.tag << tf
			tf.save
		else
			tn = Tag.create :name => name
			@run.tag << tn
		
		end
		
	end
	
    		if params[:global]
		@run.save
			
		else
			@usrun = UserRun.create :user => current_user, :curr_eps => 0, :interval => 0, :run => @run
		end
		redirect_to runs_path
  end

  # PUT /runs/1
  # PUT /runs/1.json
  def update

	  if current_user.is_admin
	    @run = Run.find(params[:id])

	@run.name = params[:run][:name]
	@run.anz_staf = params[:run][:anz_staf]
	@run.anz_eps = params[:run][:anz_eps]
	
	@run.global = params[:run][:global]
	tag = params[:run][:tag].split(',')
		tf = Tag.new
	@run.tag= []
	@run.save
	tag.each do |name|
		puts name
		find = false
		if Tag.all.size != 0
			Tag.all.each do |ta|
				if ta.name == name
				
					find = true;
					tf = ta
		
				end
			end
		else
		  	tn = Tag.create :name => name
		end

		if find
			@run.tag << tf
		else
			tn = Tag.create :name => name
			@run.tag << tn
		end
		
	end

	  end
		redirect_to run_path params[:id]
  end

  def ratep
		@run = Run.find(params[:id])
		@run.rating= @run.rating+1
		@run.anz_rating= @run.anz_rating+1
		@run.save
      		redirect_to :back
  end

  def ratem
		@run = Run.find(params[:id])
		@run.anz_rating= @run.anz_rating+1
		@run.rating= @run.rating-1
		@run.save
      		redirect_to :back
  end

  # DELETE /runs/1
  # DELETE /runs/1.json
  def destroy
	if current_user.is_admin
	    @run = Run.find(params[:id])
	    
	    allrun=UserRun.all
	    allrun.each do |r|
		if (r.run_id.to_i == params[:id].to_i)
			uid=r.user_id
			myu=User.find uid	
			myur=myu.user_run
			myur=myur.delete_if {|x| x.run_id == params[:id] } 
			myu.save
			r.destroy
			
		end
		
	end
	    @run.destroy
	

	    respond_to do |format|
	      format.html { redirect_to runs_url }
	      format.json { head :ok }
		end
	  end
  end
end
