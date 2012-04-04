require 'rest_client'
require 'json'

module Mijireh
  @@access_key = nil
  @@base_url = 'http://mist.mijireh.com/api/1'

  class << self
    def access_key=(access_key)
      @@access_key = access_key
    end 

    def access_key
      @@access_key
    end

    def base_url
      @@base_url
    end
  end

  class Base
    def initialize(json)
      @json = json
    end

    def method_missing(name, *args)
      return @json[name.to_s] if @json.has_key?(name.to_s)
      super
    end

    class << self
      def get(resource)
        resource = RestClient::Resource.new("#{Mijireh.base_url}/#{resource}", user: Mijireh.access_key)
        JSON.parse(resource.get(accept: 'application/json'))
      end

      def post(resource, attributes)
        resource = RestClient::Resource.new("#{Mijireh.base_url}/#{resource}", user: Mijireh.access_key)
        json = resource.post(attributes.to_json, content_type: 'json', accept: 'application/json')
        JSON.parse(json)
      end
    end
  end

  class Store < Base
    class << self
      def retrieve
        new get('store')
      end
    end
  end

  class Order < Base
    class << self
      def create(attributes)
        new post('orders', attributes)
      end
    end
  end
end
