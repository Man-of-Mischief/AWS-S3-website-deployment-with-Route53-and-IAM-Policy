data "aws_route53_zone" "myzone" {
  name         = "nidhin.co.in"
  private_zone = false
}
 
data "aws_iam_policy_document" "bucket_policy" {
 
  statement {
    actions   = ["s3:ListBucket"]

    resources = [
      "arn:aws:s3:::webserver.nidhin.co.in"
    ]
    effect = "Allow"
    
    principals {
      type        = "*"
      identifiers = ["*"]
    }
  }

  statement {
    actions = [ "s3:GetObject", "s3:PutObject" ]
 
    resources = [
      "arn:aws:s3:::webserver.nidhin.co.in/*"
    ]
    effect = "Allow"

    principals {
      type        = "*"
      identifiers = ["*"]
    }
  }
}
