#!/usr/bin/ruby

require 'combine_pdf'

scanPdfPath = ARGV[0]

if ARGV[0] == nil
  puts "usage: split_pdf.rb <pdf_file_name>"
  -1
else
  #todo: validate path

  scanPdf = CombinePDF.load(scanPdfPath)

  #number of pages in the target file
  targetSize = 2

  0.step(scanPdf.pages.count-1, targetSize) do |currentSourcePageIndex|
    targetPdf = CombinePDF.new
    0.upto(targetSize-1) do |targetPageOffset|
      newPage = scanPdf.pages[currentSourcePageIndex + targetPageOffset].copy
      targetPdf.insert -1 , newPage
      targetPdf.save "target-" + currentSourcePageIndex.to_s + ".pdf"
    end
  end
end
