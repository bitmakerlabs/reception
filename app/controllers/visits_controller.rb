class VisitsController < ApplicationController
  def new
    @visit = Visit.new
    @visit.build_visitor
    @visit.build_host
    @hosts = Host.all.collect { |host| [ host.name, host.id] }
  end

  def create
    @visit = Visit.new(visit_params)

    photo = Paperclip.io_adapters.for(visit_params[:visitor_attributes][:photo])
    photo.original_filename = 'photo.png'
    @visit.visitor.photo = photo

    if @visit.save
      client = Slack::Web::Client.new
      client.chat_postMessage(
        channel: "#reception",
        text: "#{@visit.visitor.name} is here to see @#{@visit.host.slack_handle}",
        username: "Receptionist"
      )

      redirect_to root_path, notice: "Thank you, #{@visit.visitor.name}. Your visit has been recorded."
    else
      render :new
    end
  end

  private
  def visit_params
    params.require(:visit).permit(:host_id, visitor_attributes: [:first_name, :last_name, :photo])
  end
end
