module Paperclip
  class PdfJpg < Processor
    def initialize file, options = {}, attachment = nil
      super
      @file = file
      @current_format = File.extname(@file.path)
      @basename = File.basename(@file.path, @current_format)
      @ext = ".jpg"
      @reformat = File.basename(@file.path, File.ext(@file.path))
    end

    def make
      dst = Tempfile.new(@basename)
      dst.binmode
#
#convert -resize 600 małaPKczerwiec.pdf[0] thumbnail1.jpg      
#
#      command = "#{File.expand_path(@file.path)} -colorspace Gray #{File.expand_path(dst.path)}"
       command = "-resize 300 #{File.expand_path(@file.path)}[0] #{File.expand_path(dst.path)}"
      
      begin
        success = Paperclip.run("convert", command)
      rescue PaperclipCommandLineError
        raise PaperclipError, "Wystąpił błąd poczas konwersji załącznika #{@basename}"
      end
      
      dst
    end
  end
end
#http://my-domain.se/paperclip-grayscale-processor/
#USE
#require 'paperclip_grayscale_processor'
#class Attachment < ActiveRecord::Base
#  belongs_to :attachable, :polymorphic => true
#
#  has_attached_file :file, :url => "/system/attachments/:id/:style/:filename",
#                           :path => ":rails_root/public/system/attachments/:id/:style/:basename.:extension",
#                           :styles => {
#                             :grayscale => { :processors => [:grayscale] }
#                            }
#  
#  validates_attachment_presence :file
#end
#
#
#
#