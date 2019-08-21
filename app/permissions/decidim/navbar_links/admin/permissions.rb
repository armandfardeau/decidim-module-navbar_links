module Decidim
  module NavbarLinks
    module Admin
      class Permissions < Decidim::DefaultPermissions
        def permissions
          return permission_action unless user
          return permission_action unless permission_action.scope == :admin

          unless user.admin?
            disallow!
            return permission_action
          end

          permission_action
        end
      end
    end
  end
end
