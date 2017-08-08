require_relative 'config/environment'

class App < Sinatra::Base
  get "/reversename/:name" do
    params[:name].reverse
  end

  get "/square/:number" do
    "#{params[:number].to_i ** 2}"
  end

  get "/say/:number/:phrase" do
    (1..params[:number].to_i).to_a.map {|x| params[:phrase]}.join
  end

  get "/:operation/:number1/:number2" do
    number1 = params[:number1].to_i
    number2 = params[:number2].to_i
    case params[:operation]
      when "add"
        "#{number1 + number2}"
      when "subtract"
        "#{number1 - number2}"
      when "multiply"
        "#{number1 * number2}"
      when "divide"
        "#{number1 / number2}"
    end
  end

  get "/say/*" do
    params[:splat].first.split("/").join(" ") + "."
  end
end

