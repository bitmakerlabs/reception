namespace :slack do
  desc "Download slack users into the hosts table. Prune existing data."
  task :users => [:environment] do
    client = Slack::Web::Client.new
    # https://api.slack.com/methods/users.list
    users_list = client.users_list
    unless users_list["members"]
      puts "Slack users.list did not return any members."
      return
    end

    members = users_list["members"].reject { |m|
      m["deleted"] ||
      m["profile"].nil? ||
      m["profile"]["first_name"].nil? ||
      m["profile"]["last_name"].nil? ||
      m["id"] == "USLACKBOT"
    }.collect { |m|
      [
        m["profile"]["first_name"],
        m["profile"]["last_name"],
        m["id"],
        m["name"]
      ]
    }

    Host.destroy_all
    Host.bulk_insert(:first_name, :last_name, :slack_id, :slack_handle, :created_at, :updated_at) do |worker|
      members.each do |member|
        worker.add member
      end
    end
  end
end
