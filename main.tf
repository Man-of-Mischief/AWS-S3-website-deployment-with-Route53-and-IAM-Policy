### main.tf  
  
resource "aws_s3_bucket" "s3" {
  bucket = "webserver.nidhin.online"
}
 
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.s3.id
    index_document {
    suffix = "index.html"
  }
}

locals {
  mime_types = {
    "css"  = "text/css"
    "html" = "text/html"
    "ico"  = "image/vnd.microsoft.icon"
    "js"   = "application/javascript"
    "json" = "application/json"
    "map"  = "application/json"
    "png"  = "image/png"
    "svg"  = "image/svg+xml"
    "txt"  = "text/plain"
    "jpg"  = "image/jpeg"
    "ttf"  = "application/font"
   "woff"  = "application/font"
   "woff2" = "application/octet-stream"
  "eot"    = "application/octet-stream"
  }
}
 

resource "aws_s3_bucket_policy" "policy" {
  bucket = aws_s3_bucket.s3.id
  policy = data.aws_iam_policy_document.bucket_policy.json
 
}
 
resource "aws_s3_bucket_public_access_block" "bucket" {
  bucket = aws_s3_bucket.s3.id
 
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
 
resource "aws_s3_object" "content" {
  bucket = aws_s3_bucket.s3.id
 
  for_each = fileset("/home/ec2-user/content", "**/*.*")
 
 
  key          = each.key
  source       = "/home/ec2-user/content/${each.key}"
  content_type = lookup(tomap(local.mime_types), element(split(".", each.key), length(split(".", each.key)) - 1))
}
 

data "aws_s3_bucket" "url" {
  bucket = aws_s3_bucket.s3.id
}

resource "aws_route53_record" "frontend" {
  zone_id = data.aws_route53_zone.myzone.zone_id
  name    = "webserver"
  type    = "CNAME"
  ttl     = 5
  records = [data.aws_s3_bucket.url.website_endpoint]
}
 
