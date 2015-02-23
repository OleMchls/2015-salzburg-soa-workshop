require 'sinatra/base'

class FileServer < Sinatra::Base
  get '/*' do
    # show file or list directory entries
  end

  put '/*' do
    # write files
  end

  delete '/*' do
    # delete files
  end
end
