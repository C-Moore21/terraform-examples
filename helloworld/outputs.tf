output "elb-url" {
  value       = aws_alb.main.dns_name
  description = "The URL of the elb"
}
