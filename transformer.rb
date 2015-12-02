require 'nokogiri'

input = ARGV[0]
xslt = ARGV[1]
output = ARGV[2]

document = Nokogiri::XML(File.read(input))
template = Nokogiri::XSLT(File.read(xslt))

transformed_document = template.transform(document)
File.open(output, 'w').write(transformed_document)
