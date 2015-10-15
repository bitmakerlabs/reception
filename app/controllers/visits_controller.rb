class VisitsController < ApplicationController
  def new
    @visit = Visit.new
    @visit.build_visitor
    @visit.build_host
    @hosts = Host.all.collect { |host| [ host.name, host.id] }
  end

  def create
    @visit = Visit.new(visit_params)

    if @visit.save
      redirect_to root_path, notice: "Your visit has been recorded."
    else
      render :new
    end
  end

  private
  def visit_params
    params.require(:visit).permit(:host_id, visitor_attributes: [:first_name, :last_name])
  end
end
