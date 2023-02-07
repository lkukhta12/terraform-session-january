# A root module can use outputs to print certain values in the CLI output after running terraform apply.

output "instance_ip_address" {
    value       = aws_instance.Session-3EC2.public_ip
    description = "The public IP address of the main EC2 instance."
}
output "instance_state" {
    value       = aws_instance.Session-3EC2.instance_state
    description = "The state of the main EC2 instance."
}