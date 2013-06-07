class Manage::CampsController < Manage::ApplicationController
  inherit_resources

  actions :all

  def index
    index! {
      @districts = districts = (params[:districts] || []).delete_if(&:blank?)
      @kinds = kinds = (params[:kinds] || []).delete_if(&:blank?)

      @camps = Camp.search {
        keywords params[:q]

        with :districts, districts if districts.any?
        with :kinds, kinds if kinds.any?
      }.results
    }
  end
end
