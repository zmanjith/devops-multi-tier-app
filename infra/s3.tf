resource "aws_s3_bucket" "assets" {
    bucket  = "s3bucket-manjith-20250908"
    tags    = {
        Name   = "AssetsBucket"
        Environment     = "dev"
    }
}

