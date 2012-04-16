class BiosensorsController < ApplicationController
  skip_before_filter :authorize
  # GET /biosensors
  # GET /biosensors.xml
  def index
    @sort_by       = params[:sort_by] || "sensor_name"
    @last_sort     = params[:last_sort] || "sensor_name" 
    @last_sort_direction     = params[:last_sort_direction] || "ASC"
    @autocomplete1 = params[:autocomplete1]|| '' 
    @autocomplete2 = params[:autocomplete2]|| ''
    @autocomplete3 = params[:autocomplete3]|| ''
    @biosensors    = []
    
    @sort_by_state = {:sensor_target_type => "", :specificity => "", :sensor_name => "", :sensor_type => "", :anal_tech => "", 
                      :iv_props => "", :organism => "", :fluorophore => "", :pi_name => ""}

    if params[:sort_by] ==  params[:last_sort]
      if @last_sort_direction == "ASC"
        @last_sort_direction = "DESC"
        @sort_by_state[@sort_by.to_sym] = "<img src=\"images/down.gif\" border=0>"
      else 
        @last_sort_direction = "ASC"
       @sort_by_state[@sort_by.to_sym] = "<img src=\"images/up.gif\" border=0>"
 
      end
    elsif params[:sort_by]
      
      @last_sort = params[:sort_by]  
      @last_sort_direction = "ASC"
      @sort_by_state[params[:sort_by].to_sym] = "<img src=\"images/up.gif\" border=0>"
    end
     
    @sort_by_state.each {|n,v| puts n.to_s + "--" + v}
 

    if (@autocomplete1.empty? && @autocomplete2.empty? && @autocomplete3.empty?) || @autocomplete1 == "all"
      #@biosensors = Biosensor.all( :order => "#{@sort_by} #{@last_sort_direction}")
      @biosensors = Biosensor.order("#{@sort_by} #{@last_sort_direction}")
    else
      #unless @autocomplete1.empty?
        #@biosensors = Biosensor.where(:specificity => @autocomplete1).order("#{@sort_by} #{@last_sort_direction}")
        @biosensors = Biosensor.where("specificity = '#{@autocomplete1}' OR specificity = '#{@autocomplete2}' OR specificity = '#{@autocomplete3}'").order("#{@sort_by} #{@last_sort_direction}")
      #end
      #unless @autocomplete2.empty?
        #@biosensors |= Biosensor.where(:specificity => @autocomplete2).order(@sort_by.to_sym)
      #end
      #unless @autocomplete3.empty?
        #@biosensors |= Biosensor.where(:specificity => @autocomplete3).order(@sort_by.to_sym)
      #end
    end
    @row_count = @biosensors.size


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @biosensors }
    end
  end

  # GET /biosensors/1
  # GET /biosensors/1.xml
  def show
    autocomplete = params[:autocomplete] 
    if autocomplete
      @biosensor = Biosensor.where(autocomplete.first)
    else
      @biosensor = Biosensor.find(params[:id])
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @biosensor }
    end
  end

  # GET /biosensors/new
  # GET /biosensors/new.xml
  def new
    @biosensor = Biosensor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @biosensor }
    end
  end

  # GET /biosensors/1/edit
  def edit
    @biosensor = Biosensor.find(params[:id])
  end

  # POST /biosensors
  # POST /biosensors.xml
  def create
    @biosensor = Biosensor.new(params[:biosensor])

    respond_to do |format|
      if @biosensor.save
        format.html { redirect_to(@biosensor, :notice => 'Biosensor was successfully created.') }
        format.xml  { render :xml => @biosensor, :status => :created, :location => @biosensor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @biosensor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /biosensors/1
  # PUT /biosensors/1.xml
  def update
    @biosensor = Biosensor.find(params[:id])

    respond_to do |format|
      if @biosensor.update_attributes(params[:biosensor])
        format.html { redirect_to(@biosensor, :notice => 'Biosensor was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @biosensor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /biosensors/1
  # DELETE /biosensors/1.xml
  def destroy
    @biosensor = Biosensor.find(params[:id])
    @biosensor.destroy

    respond_to do |format|
      format.html { redirect_to(biosensors_url) }
      format.xml  { head :ok }
    end
  end
end
