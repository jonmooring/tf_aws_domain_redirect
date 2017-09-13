# Terraform AWS domain redirect

Terraform module for AWS allowing you to redirect from one domain to another using S3 and Route 53.

## Usage

```
module "example_com_redirect" {
  source = "github.com/portpaw/tf_aws_domain_redirect"
  domain = "example.com"
  redirect = "example.net"
  zone_id = "${aws_route53_zone.example_com.zone_id}"
}
```

This assumes you've already set up a Route 53 Terraform resource for example.com.

## Authors

Created by [Jon Mooring](https://github.com/portpaw)

## License

MIT. See LICENSE for full details.
