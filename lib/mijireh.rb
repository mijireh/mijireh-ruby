module Mijireh
  @@access_key = nil

  def self.access_key=(access_key)
    @@access_key = access_key
  end 

  def self.access_key
    @@access_key
  end
end
