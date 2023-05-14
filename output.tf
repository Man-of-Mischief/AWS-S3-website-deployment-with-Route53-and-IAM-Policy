output "website_url" {
  value = data.aws_s3_bucket.url.website_endpoint
}
