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

  class Store
    def initialize(json)
      @json = json
    end

    def method_missing(name, *args)
      return @json[name.to_s] if @json.has_key?(name.to_s)
      super
    end

    class << self
      def retrieve
        resource = RestClient::Resource.new("#{Mijireh.base_url}/store", user: Mijireh.access_key)
        Store.new(JSON.parse(resource.get(accept: 'application/json')))
      end
    end
  end

  class Order
    def initialize(json)
      @json = json
    end

    def method_missing(name, *args)
      return @json[name.to_s] if @json.has_key?(name.to_s)
      super
    end

    class << self
      def create(attrs)
        resource = RestClient::Resource.new("#{Mijireh.base_url}/orders", user: Mijireh.access_key)
        json = resource.post(attrs.to_json, content_type: 'json', accept: 'application/json')
        Order.new(JSON.parse(json))
      end
    end
  end
end
