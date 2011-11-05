require "prawn/measurement_extensions"

a = @c.width
b = @d.length
pdf = Prawn::Document.new(:page_layout => :portrait,
                     :left_margin => 0.mm,
                     :right_margin => 0.mm,
                     :top_margin => 0.mm,
                     :bottom_margin => 0.mm,
                     :page_size => [a.mm, b.mm])


pdf.bounding_box [pdf.bounds.absolute_left, pdf.bounds.absolute_top], :width => a.mm, :height => b.mm do
	pdf.image "#{RAILS_ROOT}/public/#{@b.image_url}", :fit => [a.mm, 297.mm]

pdf.bounding_box([55.mm, 290.mm], :width => 100.mm, :height =>200.mm) do
	
	
pdf.text "<color rgb='FF00FF'>#{@a.promotext}</color> " +
	       	"<color c='250' m='0' y='0' k='0'>#{@a.promotext}</color>", 
			:align => :center,
			:font => "Courier",
			:size => 30,
			:styles => [:bold],
			:inline_format => true


pdf.move_down 110.mm
pdf.font("Courier")
pdf.text	"<color c='250' m='200' y='200' k='250'>#{@a.promotext}</color>", 
			:align => :center,
			:font => "Courier",
			:size => 40,
			:styles => [:bold],
			:inline_format => true

end
end