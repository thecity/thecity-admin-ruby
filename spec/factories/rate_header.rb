module TheCity
  class RateHeader < Struct.new(:ip_limit, :ip_remaining, :account_limit, :account_remaining)
    def header_raw
      ["X-City-RateLimit-Limit-By-Ip: #{ip_limit}",
       "X-City-RateLimit-Remaining-By-Ip: #{ip_remaining}",
       "X-City-RateLimit-Limit-By-Account: #{account_limit}",
       "X-City-RateLimit-Remaining-By-Account: #{account_remaining}"].join("\r\n")
    end
  end
end