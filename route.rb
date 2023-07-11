require 'sinatra'

get '/' do
  File.read('index.html')
end

get '/index' do
  redirect '/'
end

get '/index.html' do
  redirect '/'
end

get '/debt' do
  File.read('debt.html')
end

get '/error' do
  File.read('error.html')
end

get '/result' do
  MAX_LIMIT = 10000
  MIN_LIMIT = 2000
  @pcode = params[:pcode]
  @amount = params[:amount].to_i
  @period = params[:period].to_i
  @modifier = nil
  @best_period = nil

  case @pcode
  when "49002010965"
    redirect '/debt'
  when "49002010976"
    @modifier = 100
  when "49002010987"
    @modifier = 300
  when "49002010998"
    @modifier = 1000
  else
    redirect '/error'
  end

  # calculate max loan(when credit score is 1, loan amount will be maximum.)
  @maximum_loan = @period*@modifier
  if @maximum_loan>=@amount
    @loan_approved = true
  else
    @loan_approved = false
  end
  # if max loan is over limit, period should be shorter.
  if @maximum_loan>MAX_LIMIT
    @maximum_loan = MAX_LIMIT
    @best_period = MAX_LIMIT/@modifier
  # if max loan is less than limit, period should be longer.  
  elsif @maximum_loan<MIN_LIMIT
    @maximum_loan = MIN_LIMIT
    @best_period = MIN_LIMIT/@modifier
  end

  erb :result
end