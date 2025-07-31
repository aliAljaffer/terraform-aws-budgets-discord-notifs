data "archive_file" "lambda_function" {
  type        = "zip"
  source_dir  = "${path.module}/function/"
  output_path = "${path.module}/function/output.zip"
}
# Installs the required libraries before packaging the function
resource "terraform_data" "install_deps" {
  provisioner "local-exec" {
    command     = "pip install -r requirements.txt -t ./"
    working_dir = "${path.module}/function/"
  }
}
