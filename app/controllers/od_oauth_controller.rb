class OdOauthController < ApplicationController
  APP_ID = 25473536
  PUBLIC_APP_KEY = "CBADLFICABABABABA"
  SECRET_APP_KEY = "EC88BF22043AD2C0637B1EE7"
  CALLBACK_URL = "http://warm-warrior-9244.heroku.com/od_oauth/callback"

  def index
    @client_id = APP_ID.to_s
    @scope = ""
    @response_type = "code"
    @redirect_uri = CALLBACK_URL
  end

  def callback
    if params[:error].present?
      @result = "error"
    else
      @code = params[:code]
      # taking an access_token
      uri = URI.parse("http://api.odnoklassniki.ru/oauth/token.do")
      http = Net::HTTP.new(uri.host, uri.port)
      req = Net::HTTP::Post.new(uri.request_uri)
      req.set_form_data({"code"          => @code,
                         "redirect_uri"  => CALLBACK_URL,
                         "grant_type"    => "authorization_code",
                         "client_id"     => APP_ID,
                         "client_secret" => SECRET_APP_KEY
                        })
      @result = http.request(req)
      #p res.body
      #p res.code # 301
    end
  end

  def logout
  end

end
