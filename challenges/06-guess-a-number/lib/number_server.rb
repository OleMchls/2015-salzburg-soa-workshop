require 'sinatra/base'

class NumberServer < Sinatra::Base
  helpers do
    def number
      return to_number(request.body.read)
    end

    def to_number(string)
      string && string =~ /^\d+$/ ? string.to_i : nil
    end
  end

  put "/number" do
    if current_number = number
      $_saved_number = current_number
      status 200
      $_saved_number.to_s
    else
      status 500
      "No number passed or passed number invalid."
    end
  end

  get "/number/:number" do
    if current_number = to_number(params[:number])
      if current_number < $_saved_number
        status 410
      elsif current_number > $_saved_number
        status 411
      else
        status 200
      end
      ""
    else
      status 500
      "No number passed or passed number invalid."
    end
  end
end
