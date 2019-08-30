# split_pdf
small ruby script to split large pdf scan result into single documents

## Background
I wrote this script to add this functionality to the MacOS Service menu by creating an Automator workflow.

## Installation
To add a new menu item so the service menu follow these steps:

* add the combine_pdf gem to your ruby by calling `gem install combine_pdf` from Terminal
* open Automator on MacOS
* click on File/New (Cmd + N)
* select "Quick Action" as your document type
* at the top of the document set the options for "Workflows receives current" to "PDF files" in "Finder"
* add the "Run Shell Script" action from the utilities category
* set the "Shell" option to "/usr/bin/ruby"
* paste the content from automator/split_pdf_service.rb into the action
* save the workflow as "split pdf"

If you right click on a pdf file you should see now a new service "split pdf".

*Note: Automator uses the built-in ruby of MacOS. If you use a different version, be sure to add the gem combine_pdf to the built-in ruby!*
