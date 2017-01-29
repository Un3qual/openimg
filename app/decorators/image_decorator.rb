class ImageDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
  def formatted_date
  	object.created_at.strftime("%R - %B %e, %Y ")
  end

  def voat_share
  	# link_to(image_tag("voat_logo.svg"), "https://voat.co/submit?linkpost=true&url=#{url_for(object)}&title=#{object.caption}")
  end

end
