require 'combine_pdf'

if ::ARGV[0] == nil
  puts "usage: rotate_pdf.rb <pdf_file_name>"
  -1
else
  scanPdfPath = ARGV[0]

  #todo: validate path

  scanPdf = CombinePDF.load(scanPdfPath)
  scanPdf.pages.each do |page|
    page.rotate_left
  end
  scanPdf.save(scanPdfPath)
end
