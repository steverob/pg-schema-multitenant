class RegistrationsController < Devise::RegistrationsController
  # POST /resource
  def create
    build_resource(sign_up_params)
    account = build_account(params)

    if account.valid?
      if resource.save
        account.save
        resource.account_id = account.id
        resource.save
        if resource.active_for_authentication?
          set_flash_message :notice, :signed_up if is_navigational_format?
          sign_up(resource_name, resource)
          respond_with resource, :location => after_sign_up_path_for(resource)
        else
          set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
          expire_session_data_after_sign_in!
          respond_with resource, :location => after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords resource
        respond_with resource
      end
    else
      set_flash_message :error, "Account Name is invalid or already taken!"
      clean_up_passwords resource
      redirect_to new_user_registration_url
    end
  end

  protected


  def build_account(params)
    Account.new name: params[:account_name], uid: params[:account_name].tr('^A-Za-z0-9', '_')
  end

  
end