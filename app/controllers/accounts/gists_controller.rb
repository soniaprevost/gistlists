class Accounts::GistsController < ApplicationController

  def destroy
    @gist = current_user.gists.find(params[:id])

    @gist.destroy

    redirect_to account_path
  end
end
