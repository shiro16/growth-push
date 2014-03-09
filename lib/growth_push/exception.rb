module GrowthPush
  class Exception < StandardError
    attr_accessor :status, :code

    class << self
      def handle_response(response)
        klass = klass_for_status(response.code.to_i)
        exception = if klass
                      klass.new(response.code, response.message)
                    else
                      Exception.new(response.code.to_i, response.code, response.message)
                    end
      end

      def klass_for_status(status)
        case status
        when 400
          BadRequest
        when 401
          Unauthorized
        when 404
          NotFound
        when 500
          InternalServerError
        end
      end
    end

    def initialize(status, code, message)
      @status = status
      @code   = code
      super message
    end
  end

  class BadRequest < Exception
    def initialize(code, message)
      super 400, code, message
    end
  end

  class Unauthorized < Exception
    def initialize(code, message)
      super 401, code, message
    end
  end

  class NotFound < Exception
    def initialize(code, message)
      super 404, code, message
    end
  end

  class InternalServerError < Exception
    def initialize(code, message)
      super 500, code, message
    end
  end
end
