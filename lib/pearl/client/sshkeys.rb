module Pearl
  class Client

    module SshKeys
      
      def ssh_keys
        response = request("ssh_keys").body
        pretty_table("SSH Keys", response)
      end

      def ssh_key(id)
        response = request("ssh_keys/#{id}").body
        pretty_table('SSH Key', response)
      end

      def delete_ssh_key(id)
        response = request("ssh_keys/#{id}/destroy").body
        pretty_basic("Deleting ssh key #{id}", response)
      end
    end
  end
end
