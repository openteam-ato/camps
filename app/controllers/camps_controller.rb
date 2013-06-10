class CampsController < MainController
  def index
    @camps = Camp.search.results

    super
  end

  def show
    @camp = Camp.find(params[:id])
    raise ActionController::RoutingError.new('Not Found') if @camp.blank?
    super
  end

  alias_method :template, :action_name
end
