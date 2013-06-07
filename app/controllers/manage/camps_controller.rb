class Manage::CampsController < Manage::ApplicationController
  inherit_resources

  actions :all

  has_scope :page, :default => 1

  def index
    index! {
      @districts = districts = (params[:districts] || []).delete_if(&:blank?)
      @kinds = kinds = (params[:kinds] || []).delete_if(&:blank?)

      @camps = Camp.search {
        keywords params[:q]

        with :districts, districts if districts.any?
        with :kinds, kinds if kinds.any?

        paginate :page => params[:page], :per_page => 10

      }.results
    }
  end
end
