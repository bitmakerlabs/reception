class VisitsController < ApplicationController
  def new
    @visit = Visit.new
    @visit.build_visitor
    @visit.build_host
    @hosts = Host.all.collect { |host| [ host.name, host.id] }
  end

  def create

  end

end
