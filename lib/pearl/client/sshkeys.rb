module Pearl
  class Client

    module Sshkeys
      
      def sshkeys
        response = request("ssh_keys").body
        pretty_table("SSH Keys", response)
      end

      def view_sshkey(id)
        response = request("ssh_keys/#{id}").body
        data = MultiJson.load(response, symbolize_keys: true)
        ssh_key = data[:ssh_key][:ssh_pub_key]
        data[:ssh_key].delete :ssh_pub_key
        pretty_table('ssh key', MultiJson.dump(data))
        print "\n"
        print ssh_key
        print "\n\n"
      end

    end
  end
end
