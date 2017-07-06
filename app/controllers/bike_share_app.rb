class BikeShareApp < Sinatra::Base
  include WillPaginate::Sinatra::Helpers

  def files
    @stations = Station.all
    @city = City.all
    @trips = Trip.all
    @conditions = Condition.all
    nil
  end

  get '/' do
    erb :index
  end

  get '/stations' do
    files
    erb :"/stations/index"
  end

  get '/trips' do
    files
    @trips = Trip.paginate(:page => params[:page], :per_page => 30)
    erb :"trips/index"
  end

  get '/stations-dashboard' do
    erb :stations_dashboard
  end

  get '/trips-dashboard' do
    files
    erb :trips_dashboard
  end

  get '/stations/new' do
    files
    erb :"stations/new"
  end

  get '/trips/new' do
    files
    erb :"trips/new"
  end

  get '/stations/:id' do
    files
    @station = Station.find(params[:id])
    erb :"stations/show"
  end

  get '/trips/:id' do
    files
    @trip = Trip.find(params[:id])
    erb :"trips/show"
  end

  get '/stations/:id/edit' do
    files
    @station = Station.find(params[:id])
    erb :"stations/edit"
  end

  get '/trips/:id/edit' do
    files
    @trip = Trip.find(params[:id])
    erb :'trips/edit'
  end

  put '/stations/:id' do |id|
    files
    @station = Station.update(id.to_i, params[:station])
    redirect "/stations/#{id}"
  end

  put '/trips/:id' do |id|
    files
    @trip = Trip.update(id.to_i, params[:trip])
    redirect "/trips/#{id}"
  end

  post '/stations' do
    files
    if params[:station][:name] == "" || params[:station][:dock_count] == 0
      @fields = params[:station].select {|key, value| key if value == ""}
      erb :"stations/error"
    else
      @station = Station.create(params[:station])
      redirect "/stations/#{@station.id}"
    end
  end

  delete '/stations/:id' do |id|
    Station.destroy(id.to_i)
    redirect '/stations'
  end

  delete '/trips/:id' do |id|
    Trip.destroy(id.to_i)
    redirect '/trips'
  end

  get '/conditions' do
    files
    erb :"conditions/index"
  end

  get '/conditions/new' do
    files
    erb :"conditions/new"
  end

  get '/conditions/:id' do
    files

    @condition = Condition.find(params[:id])
    erb :"conditions/show"
  end

  get '/conditions/:id/edit' do
    files
    @condition = Condition.find(params[:id])
    erb :"conditions/edit"
  end

  put '/conditions/:id' do |id|
    files
    @condition = Condition.update(id.to_i, params[:condition])

    redirect "/conditions/#{id}"
  end

  post '/conditions' do
    files
    if params[:condition][:date] == "" || params[:condition][:mean_temp] == 0
      erb :"stations/error"
    else
      @weather = Condition.create(params[:weather])
      redirect "/conditions/#{@weather.id}"
    end
  end

  delete '/conditions/:id' do |id|
    Condition.destroy(id.to_i)
    redirect '/conditions'
  end

  get '/weather-dashboard' do
    files
    erb :weather_dashboard
  end

end
