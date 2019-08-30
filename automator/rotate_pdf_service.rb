require 'combine_pdf'

ARGF.each do |f|
  scanPdfPath = f.to_s.chop
  puts "rotate pdf #{scanPdfPath}"
  #todo: validate path

  scanPdf = CombinePDF.load(scanPdfPath)
  scanPdf.pages.each do |page|
    page.rotate_right
  end
  scanPdf.save(scanPdfPath)
end
