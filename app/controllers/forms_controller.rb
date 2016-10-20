class FormsController < ApplicationController
  def contact_request
    req_params = params[:contact_request] || {}

    req = FormConfigs::ContactRequest.new(req_params)
    req.referer = request.referer
    req.session_id = session.id
    req.locale = I18n.locale
    req.save

    ApplicationMailer.new_contact_request(req).deliver_now

    data = {}
    render json: data, status: 201
  end
end