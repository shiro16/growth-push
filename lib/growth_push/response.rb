require 'multi_json'

module GrowthPush
  class Response
    def self.handle(response)
      _response = if response_body_not_json?(response.body)
        (response.body == 'true')
      else
        begin
          ::MultiJson.load(response.body)
        rescue MultiJson::DecodeError
          response.body
        end
      end

      if (200...300).include?(response.code.to_i)
        _response
      else
        Exception.handle_response(response)
      end
    end

    def self.response_body_not_json?(body)
      body == 'true' || body == 'false' || body == '[]'
    end
  end
end

