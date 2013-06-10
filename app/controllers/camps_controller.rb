class CampsController < MainController
  def index
    @camps = Camp.search.results

    super
  end

  def show
    @camp = Camp.find(params[:id])
  end

  alias_method :template, :action_name
end
