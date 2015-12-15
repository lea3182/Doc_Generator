# Paperclip only allows a limited set of values to be used in the path: filename, timestamp, rails_env, class, basename, extension, id, fingerprint, id_partition, attachment, and style. 
# This allows access to user_id in paperclip path
Paperclip.interpolates :user_id do |attachment, style|
  attachment.instance.user_id 
end