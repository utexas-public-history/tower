module Jekyll

  class ImageGalleryWrapperStartTag < Liquid::Tag
    def initialize(tag_name, markup, tokens)
      super
    end

    def render(context)
      "<div class=\"image-gallery image-block\">\n"
    end
  end

  class ImageGalleryWrapperEndTag < Liquid::Tag
    def initialize(tag_name, markup, tokens)
      super
    end

    def render(context)
      "</div>\n"
    end
  end

  class ImageGalleryStartTag < Liquid::Tag
    def initialize(tag_name, markup, tokens)
      super
    end

    def render(context)
      "<div class=\"row\">\n"
    end
  end

  class ImageGalleryEndTag < Liquid::Tag
    def initialize(tag_name, markup, tokens)
      super
    end

    def render(context)
      "</div>\n"
    end
  end

  class ImageGalleryCellTag < Liquid::Tag
    def intialize(tag_name, markup, tokens)
      @markup = markup
      @path = ''
      @alt = false
      @lightbox = false
      @lightbox_label = ''
      @lightbox_title = ''
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
      @lightbox = true if args[2] == 'true'
      @lightbox_label = args[3] unless args[3].nil?
      @lightbox_title = args[4] unless args[4].nil?
      @fullsize_path = args[5] unless args[5].nil?

      result = "<div class=\"image col-xs-6 col-md-3\">\n"
      result += "<a" if @lightbox
      result += " data-lightbox=\"#{@lightbox_label}\"" if @lightbox
      result += " data-title=\"#{@lightbox_title}\"" if @lightbox
      result += " href=\"#{site.baseurl}/images/posts/#{@fullsize_path}\">" if @lightbox
      result += "<img src=\"#{site.baseurl}/images/posts/#{@path}\""
      result += " alt=\"#{@alt}\"" if @alt
      result += " />\n"
      result += "</a>\n" if @lightbox
      result += "</div>\n"
    end
  end

  class ImageGalleryCaptionTag < Liquid::Tag
    def initialize(tag_name, markup, tokens)
      @markup = markup
      @caption = false
      @credit = false
    end

    def render(context)
      text = Liquid::Template.parse(@markup).render(context)
      args = text.split('::')
      args.map! { |arg| arg.strip }

      site = context.registers[:site]

      @caption = args[0] unless args[0] == 'false'
      @credit = args[1] unless args[1] == 'false'

      result = "<p class=\"caption\">\n"
      result += "#{@caption}\n" if @caption
      result += "<span class=\"credit\">#{@credit}</span>\n" if @credit
      result += "</p>\n"

      result
    end
  end

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
Liquid::Template.register_tag('start_image_gallery_wrapper', Jekyll::ImageGalleryWrapperStartTag)
Liquid::Template.register_tag('end_image_gallery_wrapper', Jekyll::ImageGalleryWrapperEndTag)
Liquid::Template.register_tag('start_image_gallery', Jekyll::ImageGalleryStartTag)
Liquid::Template.register_tag('end_image_gallery', Jekyll::ImageGalleryEndTag)
Liquid::Template.register_tag('image_gallery_caption', Jekyll::ImageGalleryCaptionTag)
Liquid::Template.register_tag('image_gallery_cell', Jekyll::ImageGalleryCellTag)
