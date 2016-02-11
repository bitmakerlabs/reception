# frozen_string_literal: true

class HostsController < ApplicationController
  before_filter :load_hosts, only: [:index]

  def index
    respond_to do |format|
      format.json do
        render json: @hosts
      end
    end
  end
end
