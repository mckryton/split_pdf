require 'combine_pdf'

ARGF.each do |f|

  scanPdfPath = f.to_s.chop

  puts "split pdf  >>" + scanPdfPath.to_s + "<<"

  scanPdf = CombinePDF.load(scanPdfPath)

  #number of pages in the target file
  targetSize = 2

  0.step(scanPdf.pages.count-1, targetSize) do |currentSourcePageIndex|
    targetPdf = CombinePDF.new
    0.upto(targetSize-1) do |targetPageOffset|
      newPage = scanPdf.pages[currentSourcePageIndex + targetPageOffset].copy
      targetPdf.insert -1 , newPage
    end
    newPath = scanPdfPath.slice(0, scanPdfPath.length - 4)
    newPath = newPath + "_split_" + (currentSourcePageIndex / targetSize).to_s + ".pdf"
    puts "create split pdf >>" + newPath + "<<"
    targetPdf.save newPath
  end
end
