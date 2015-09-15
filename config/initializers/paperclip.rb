Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
Paperclip::Attachment.default_options[:s3_host_name] = 's3-us-west-1.amazonaws.com'

# These options were originally in model. 
  # url: "/documents/:id/:style/:basename.:extension", #where to retrieve the files
  # path: ":rails_root/public/doc_pdf/:id/:style/:basename.:extension" #where to save the file 
  # :url => "/assets/providers/:id/:style/:basename.:extension",
  # :path => ":rails_root/public/assets/providers/:id/:style/:basename.:extension"