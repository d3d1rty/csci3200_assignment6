#Assignment 6 - CSCI 3200 (APSU)
##About
This project is an assignment for CSCI 3200 (XML Processing) course at APSU. Being this is an educational project for a grade, collaboration isn't exactly the goal here. But if you feel that you can benefit from perusing my code, go for it! 

For reference, I have included the original assignment instructions. 

##What it Does
The purpose of the project is to create an XSLT template which transforms the original document into an HTML file based off of options selected in the `fb_config.xml` stylesheet.

##Usage
* Navigate to the project directory.
* Change desired options in `fb_config.xml`.
* Transform the document with the included ruby script.
  * Execute command: `ruby transformer.rb world_factbook_2008.xml wfb.xsl output.html`
  * The first argument is the original XML document to be transformed.
  * The second argument is the XSLT template.
  * The third argument is the output file, which should be an HTML file.
* View the output file in a browser.

##Dependencies
For the ruby script to work, you need 'nokogiri'
* Execute command `gem install nokogiri` to install the gem.

##Academic Honesty
Please, just keep in mind that academic dishonesty is probably (definitely) not tolerated by your educational institution, so come up with your own solutions. Besides, I sincerely doubt that your assignment has the same requirements as mine, so you will probably look like an idiot if you try to turn this in.

##Credits
Thanks to the nokogiri project for an awesome XML parser!

Also, thanks to the CIA for publishing the Factbook! Waterboarding sucks, though.

##Questions/Comments/Concerns
If you have any questions regarding this project, send me a message and I'd be more than happy to explain my code.

