# AWS-S3-website-deployment-with-Route53-and-IAM-Policy
This Terraform code creates an S3 bucket for website hosting and configures website settings, sets up a Route53 record for the website, and applies an IAM policy to the bucket to allow public access to website content. The code also includes a local variable for MIME types and an output for the website URL.

# Prerequisites
To use this code, you must have the following prerequisites:

An AWS account

AWS CLI installed and configured with access keys

Terraform installed on your local machine

# How to Execute the Code
Clone the repository to your local machine.

Navigate to the cloned repository.

Run terraform init to initialize Terraform.

Run terraform plan to see the execution plan for the code.

Run terraform apply to apply the changes to your AWS account.

Once the apply is complete, the website URL will be outputted to the console. You can also find the website URL in the output.tf file.

To destroy the infrastructure, run terraform destroy.

Note: Before running the code, ensure that you have updated the necessary variables such as the S3 bucket name, Route53 zone name, and IAM policy statements according to your requirements.

# Conclusion
This Terraform code is a simple and efficient way to deploy a static website to AWS S3, configure it for website hosting, and create a Route53 record. The included IAM policy also allows for public access to website content.
