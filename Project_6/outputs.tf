# Output - For Loop with List
output "for_output_list" {
  description = "For Loop with List"
  value       = [for instance in aws_instance.MyServer : instance.public_dns]
}

# Output - For Loop with Map
output "for_output_map1" {
  description = "For Loop with Map"
  value       = { for instance in aws_instance.MyServer : instance.id => instance.public_dns }
}

# Output - For Loop with Map Advanced
output "for_output_map2" {
  description = "For Loop with Map - Advanced"
  value       = { for c, instance in aws_instance.MyServer : c => instance.public_dns }
}
/*
# Output Legacy Splat Operator (latest) - Returns the List
output "legacy_splat_instance_publicdns" {
  description = "Legacy Splat Expression"
  value = aws_instance.MyServer.*.public_dns
}  */

# Output Latest Generalized Splat Operator - Returns the List
output "latest_splat_instance_publicdns" {
  description = "Generalized Splat Expression"
  value       = aws_instance.MyServer[*].public_dns
}

output "public_dns" {
  description = "Public DNS for instance"
  value       = aws_instance.MyServer[*].public_dns
}