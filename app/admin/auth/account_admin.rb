Trestle.resource(:account, model: User, scope: Auth, singular: true) do
  instance do
    current_user
  end

  remove_action :new, :edit, :destroy

  form do |_user|
    text_field :email

    row do
      col(sm: 6) { password_field :password }
      col(sm: 6) { password_field :password_confirmation }
    end
  end

  # Ignore the password parameters if they are blank
  update_instance do |instance, attrs|
    if attrs[:password].blank?
      attrs.delete(:password)
      attrs.delete(:password_confirmation) if attrs[:password_confirmation].blank?
    end

    instance.assign_attributes(attrs)
  end

  # Log the current user back in if their password was changed
  if Devise.sign_in_after_reset_password
    after_action on: :update do
      login!(instance) if instance.encrypted_password_previously_changed?
    end
  end

  # Limit the parameters that are permitted to be updated by the user
  params do |params|
    params.require(:account).permit(:email, :password, :password_confirmation)
  end
end
