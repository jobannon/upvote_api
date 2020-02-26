class UpsplashService

  def initialize(keyword)
    @keyword = keyword
  end

  def get_keyword_photo
    get_json('/search/photos')
  end

  private

  def conn
    Faraday.new('https://api.unsplash.com') do |config|
      config.params['client_id'] = ENV['UPSPLASH_ACCESS_KEY']
    end 
  end

  def get_json(uri)
    response = conn.get(uri) do |c|
      c.params['query'] = @keyword
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
