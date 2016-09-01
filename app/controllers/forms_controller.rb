class FormsController < ApplicationController
  def hire_us_request
    req_params = params[:contact_request] || {}

    req = ContactRequest.new(req_params)
    req.referer = request.referer
    req.session_id = session.id
    req.locale = I18n.locale
    req.save

    ApplicationMailer.new_hire_us_request(req).deliver_now

    data = {}
    render json: data, status: 201
  end
end