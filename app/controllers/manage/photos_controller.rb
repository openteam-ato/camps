class Manage::PhotosController < Manage::ApplicationController
  inherit_resources

  actions :show, :create, :destroy

  belongs_to :camp

  def create
    @camp = Camp.find(params[:camp_id])
    @photo = @camp.photos.create(:image => params[:photos][:image].first)
  end

  def destroy
    destroy! {
      render :nothing => true and return
    }
  end
end
