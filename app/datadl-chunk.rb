require 'aws-sdk-s3'

# Configuration
endpoint = ENV['S3_ENDPOINT_URL']
bucket_name = ENV['S3_BUCKET']
object_key = ENV['S3_FILE']
output_file = ENV['OUTPUT_FILE']

# Configuration du client S3
Aws.config.update(
  endpoint: endpoint,
  region: region,
  ssl_verify_peer: ENV['SSL_VERIFY_PEER'],
  force_path_style: true
)

# Création du client S3
s3_client = Aws::S3::Client.new

begin
  File.open(output_file, 'wb') do |file|
    s3_client.get_object(
      bucket: bucket_name,
      key: object_key
    ) do |chunk|
      file.write(chunk)
    end
  end
  
  puts "Fichier téléchargé avec succès : #{output_file}"
rescue Aws::S3::Errors::ServiceError => e
  puts "Erreur lors du téléchargement : #{e.message}"
end