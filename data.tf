data "archive_file" "vue_static_zip" {
  type        = "zip"
  source_dir  = "${path.module}/vue/dist"
  output_path = "${path.module}/zip/vue-static.zip"
}
