
Aws.config.update({
  region: 'eu-central-1',
  credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY']),
  })

# AWS_ACCESS_KEY_ID = ENV['AWS_ACCESS_KEY_ID']
# AWS_SECRET_ACCESS_KEY = ENV['AWS_SECRET_ACCESS_KEY']
S3_BUCKET = Aws::S3::Resource.new.bucket('rubypinterest-bucket-prod')
