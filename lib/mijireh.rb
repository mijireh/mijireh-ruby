require 'rest_client'
require 'json'

module Mijireh
  @@access_key = nil

  class << self

    def access_key=(access_key)
      @@access_key = access_key
    end 

    def access_key
      @@access_key
    end

  end

  class Store
    attr_accessor :name, :mode, :status, :time_zone, :paid_order_count, :monthly_sales, :total_sales, :slurped

    def initialize(attrs={})
      attrs.each do |name, value|
        send("#{name}=", value.to_s.length == 0 ? nil : value)
      end
    end

    class << self
      def retrieve
        resource = RestClient::Resource.new('http://mist.mijireh.com/api/1/store', user: Mijireh.access_key)
        Store.new(JSON.parse(resource.get(accept: 'application/json')))
      end
    end

  end
end
