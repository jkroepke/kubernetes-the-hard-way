name = "joe-k8s-sandbox"
availability_zones = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
vpc_cidr_block = "10.240.0.0/16"

versions = {
  coreos = "32"
  ubuntu = "focal"

  cri_o = "1.19.0"

  kubernetes = "1.19.3"
  # https://github.com/kubernetes/kubernetes/blob/release-1.19/cmd/kubeadm/app/constants/constants.go#L429
  etcd = "3.4.13-0"
}
