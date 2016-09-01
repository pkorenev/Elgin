class ApplicationMailer < ActionMailer::Base
  layout 'mailer'

  def new_contact_request(r)
    @contact_request = r

    mail(
        template_name: "call_request",
        to: receivers("contact_request"),
        from: "Elgin <#{ActionMailer::Base.smtp_settings[:user_name]}>",
        subject: "New contact request"
    )
  end
end
