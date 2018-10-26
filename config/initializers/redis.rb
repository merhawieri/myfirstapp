if Rails.env.production?
  $redis = Redis.new(url: ENV["REDIS_URL"])
else
  $redis = Redis.new(host: 'localhost', port: 6379)
end
if ENV["REDISCLOUD_URL"]
    $redis = Redis.new(:url => ENV["REDISCLOUD_URL"])
end
