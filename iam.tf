resource "aws_iam_user" "demo-1" {
  name = "demo"
  path = "/"
}
# (Optional) Create Access Key for Programmatic Access
resource "aws_iam_access_key" "demo_key" {
  user = aws_iam_user.demo-1.name
}

# IAM Policy for Full S3 Access (You can replace this with a custom one)
resource "aws_iam_policy" "s3_full_access" {
  name        = "s3demo"
  description = "Allow full access to all S3 buckets (or restrict to one)"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = "s3:*",
        Resource = "*"
      }
    ]
  })
}
# Attach Policy to User
resource "aws_iam_user_policy_attachment" "attach_s3_policy" {
  user       = aws_iam_user.demo-1.name
  policy_arn = aws_iam_policy.s3_full_access.arn
}
