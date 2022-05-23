variable "upload_directory" {
  default = "vue/dist/"
}

variable "mime_types" {
  default = {
    htm  = "text/html"
    html = "text/html"
    css  = "text/css"
    ttf  = "font/ttf"
    js   = "application/javascript"
    map  = "application/javascript"
    json = "application/json"
    nojekyll = "text/plain"
  }
}

resource "aws_s3_bucket_object" "vue_bucket_object" {
  for_each     = fileset(var.upload_directory, "**/*.*")
  bucket       = aws_s3_bucket.vue_bucket.id
  key          = replace(each.value, var.upload_directory, "")
  source       = "${var.upload_directory}${each.value}"
  acl          = "public-read"
  etag         = filemd5("${var.upload_directory}${each.value}")
  content_type = lookup(var.mime_types, split(".", each.value)[length(split(".", each.value)) - 1])
}

resource "aws_s3_bucket" "vue_bucket" {
  bucket = "vue-static-bucket"
  versioning {
    // TODO: deprecated
    enabled = false
  }
}
