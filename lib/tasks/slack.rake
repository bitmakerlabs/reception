namespace :slack do
  desc "Download slack users into the hosts table"
  task :users => [:environment] do
    client = Slack::Web::Client.new
    users_list = client.users_list
    members = users_list["members"].select do |member|
      member["deleted"] == false
    end.collect do |member|
      {
        first_name: member["profile"]["first_name"],
        last_name: member["profile"]["last_name"],
        slack_handle: member["name"]
      }
    end

    Host.bulk_insert do |worker|
      members.each do |member|
        worker.add member
      end
    end
  end
end
