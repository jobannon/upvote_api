class IdeasPhotoGetter

  def initialize(title)
    @keyword = title
  end

  def get_photo
    returned_json_photo = UpsplashService.new(@keyword).get_keyword_photo
    returned_json_photo[:results].first[:urls][:full]
  end
end
