module Jekyll

  class ImageBlockTag < Liquid::Tag
    def initialize(tag_name, markup, tokens)
      @markup = markup
      @path = ''
      @alt = false
      @tall = false
      @caption = false
      @credit = false
      @lightbox = false
      @lightbox_label = ''
      @fullsize_path = ''
      super
    end

    def render(context)
      text = Liquid::Template.parse(@markup).render(context)
      args = text.split('::')
      args.map! { |arg| arg.strip }

      site = context.registers[:site]

      @path = args[0]
      @alt = args[1] unless args[1] == 'false'
      @tall = true if args[2] == 'true'
      @caption = args[3] unless args[3] == 'false'
      @credit = args[4] unless args[4] == 'false'
      @lightbox = true if args[5] == 'true'
      @lightbox_label = args[6] unless args[6].nil?
      @fullsize_path = args[7] unless args[7].nil?

      result = "<div class=\"image-block\">\n"
      result += "<a data-lightbox=\"#{@lightbox_label}\" href=\"#{site.baseurl}/images/posts/#{@fullsize_path}\">\n" if @lightbox
      result += "<img src=\"#{site.baseurl}/images/posts/#{@path}\""
      result += " alt=\"#{@alt}\"" if @alt
      result += " class=\"tall-image\"" if @tall
      result += " />\n"
      result += "</a>\n" if @lightbox
      result += "<p class=\"caption\">\n" if @caption or @credit
      result += "#{@caption}\n" if @caption
      result += "<span class=\"credit\">#{@credit}</span>\n" if @credit
      result += "</p>\n" if @caption or @credit
      result += "</div>\n"

      result
    end
  end

end

Liquid::Template.register_tag('imageblock', Jekyll::ImageBlockTag)
