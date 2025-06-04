output "eks_cluster_name" {
  value = aws_eks_cluster.eks.name
}

output "private_subnets" {
  value = [
    aws_subnet.private_zone1.id,
    aws_subnet.private_zone2.id
  ]
}
