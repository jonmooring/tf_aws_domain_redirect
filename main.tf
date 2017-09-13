resource "aws_s3_bucket" "apex" {
  bucket = "${var.domain}"
  acl = "public-read"
  policy = <<POLICY
{
  "Version":"2012-10-17",
  "Statement":[{
    "Sid":"PublicReadForGetBucketObjects",
    "Effect":"Allow",
    "Principal": "*",
    "Action":"s3:GetObject",
    "Resource":["arn:aws:s3:::${var.domain}/*"]
  }]
}
POLICY

  website {
    redirect_all_requests_to = "${var.redirect}"
  }
}

resource "aws_s3_bucket" "www" {
  bucket = "www.${var.domain}"
  acl = "public-read"
  policy = <<POLICY
{
  "Version":"2012-10-17",
  "Statement":[{
    "Sid":"PublicReadForGetBucketObjects",
    "Effect":"Allow",
    "Principal": "*",
    "Action":"s3:GetObject",
    "Resource":["arn:aws:s3:::www.${var.domain}/*"]
  }]
}
POLICY

  website {
    redirect_all_requests_to = "${var.redirect}"
  }
}

resource "aws_route53_record" "apex" {
  zone_id = "${var.zone_id}"
  name = "${var.domain}"
  type = "A"

  alias {
    name = "${aws_s3_bucket.apex.website_domain}"
    zone_id = "${aws_s3_bucket.apex.hosted_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "www" {
  zone_id = "${var.zone_id}"
  name = "www"
  type = "A"

  alias {
    name = "${aws_s3_bucket.www.website_domain}"
    zone_id = "${aws_s3_bucket.www.hosted_zone_id}"
    evaluate_target_health = false
  }
}
