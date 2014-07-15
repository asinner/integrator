module UploadsHelper
  def s3_url bucket, file
    "https://s3.amazonaws.com/#{bucket}/#{file}"
  end
end
