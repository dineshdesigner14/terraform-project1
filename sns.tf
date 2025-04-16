resource "aws_sns_topic" "user_updates" {
  name = "demo1"
}
resource "aws_s3_bucket_notification" "sns_event" {
  bucket = aws_s3_bucket.buckt1ewefvhtredcvbgfdclmnuiolkqadsrgv.id

  topic {
    topic_arn = aws_sns_topic.user_updates.arn
    events    = ["s3:ObjectCreated:*"]
  }
}
resource "aws_sns_topic_policy" "allow_s3" {
  arn = aws_sns_topic.user_updates.arn
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "SNS:Publish"
        Effect    = "Allow"
        Resource  = aws_sns_topic.user_updates.arn
        Principal = {
          Service = "s3.amazonaws.com"
        }
      }
    ]
  })
}


