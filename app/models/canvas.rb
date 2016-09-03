require 'rest-client'
class Canvas < ApplicationRecord
  def self.update_canvases
    response = RestClient.get 'https://api.usecanvas.com/v1/canvases', {accept: :json, Authorization: "Bearer #{ENV['CANVAS_API_KEY']}"}
    json = JSON.parse response
    json['data'].each do |canvas|
      attribs = canvas['attributes']
      Canvas.create!(canvas_title: attribs['title'], canvas_key: canvas['id'], canvas_updated: attribs['updated_at'].to_datetime, canvas_created: attribs['created_at'].to_datetime)
    end
  end
end
