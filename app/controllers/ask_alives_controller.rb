class AskAlivesController < ApplicationController
  def confirm
    @ask = AskAlive.find_by_token(params[:token])
    @ask.update(:status => params[:status])

    @ask.user.update(:status => @ask.status)

  end

end
