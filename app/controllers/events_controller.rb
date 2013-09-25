class EventsController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource :find_by => :url

  # GET /events
  # GET /events.json
  def index

    if params[:tag]
      @events = Event.tagged_with(params[:tag]).order("startdatetime asc").page(params[:page]).per_page(20)
    else
      if params[:sitecity]
        @events = Event.where(sitecity_id: Sitecity.find_by_url(params[:sitecity])).order("startdatetime asc").page(params[:page]).per_page(20)
      else
        if params[:location]
          @events = Event.where(location_id: Location.find_by_url(params[:location])).order("startdatetime asc").page(params[:page]).per_page(20)
        else
          @events = Event.order("startdatetime asc").page(params[:page]).per_page(20)
        end      
      end
    end


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find_by_url(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = current_user.events.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = current_user.events.find_by_url(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = current_user.events.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: t(:event_success) }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = current_user.events.find_by_url(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: !(:event_update_success) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = current_user.events.find_by_url(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  def event_params
   params.require(:event).permit(:description, :image)
  end

end
