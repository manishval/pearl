module Pearl
  class Client

    module Sshkeys
      def sshkeys
        response = request("ssh_keys").body
        pretty_table("SSH Keys", response)
      end
    end
  end
end
