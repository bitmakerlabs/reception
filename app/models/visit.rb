class Visit < ActiveRecord::Base
  belongs_to :visitor
  belongs_to :host

  accepts_nested_attributes_for :visitor

  after_save :notify_slack

  private
  def notify_slack
    client = Slack::Web::Client.new
    message_payload = {
      channel: "#reception",
      text: "#{visitor.name} is here to see @#{host.slack_handle}",
      username: "Receptionist",
      link_names: true,
      attachments: [
        { fallback: "Visitor Mugshot", image_url: visitor.photo.url }
      ].to_json
    }
    client.chat_postMessage(message_payload)
  end
end
