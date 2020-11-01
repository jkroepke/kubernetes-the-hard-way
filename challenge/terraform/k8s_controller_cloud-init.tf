data "template_cloudinit_config" "controller" {
  gzip          = false
  base64_encode = false

  part {
    filename     = "kickstart.yaml"
    content_type = "text/cloud-config"
    content      = file("cloud-init/kickstart.yaml")
  }

  part {
    filename     = "etcd.key"
    content_type = "text/cloud-config"
    content      = templatefile("cloud-init/parts/write_file.yaml", {
      path = "/etc/etcd/ca.key"
      content = tls_private_key.etcd-key["etcd-ca"].private_key_pem
    })
  }

  part {
    filename     = "etcd.key"
    content_type = "text/cloud-config"
    content      = templatefile("cloud-init/parts/write_file.yaml", {
      path = "/etc/etcd/ca.crt"
      content = tls_self_signed_cert.etcd-ca.cert_pem
    })
  }

  part {
    filename     = "kubernetes.key"
    content_type = "text/cloud-config"
    content      = templatefile("cloud-init/parts/write_file.yaml", {
      path = "/etc/kubernetes/ca.key"
      content = tls_private_key.kubernetes-key["kubernetes-ca"].private_key_pem
    })
  }

  part {
    filename     = "etcd.key"
    content_type = "text/cloud-config"
    content      = templatefile("cloud-init/parts/write_file.yaml", {
      path = "/etc/kubernetes/ca.crt"
      content = tls_self_signed_cert.kubernetes-ca.cert_pem
    })
  }

  part {
    filename     = "kubernetes.key"
    content_type = "text/cloud-config"
    content      = templatefile("cloud-init/parts/write_file.yaml", {
      path = "/etc/kubernetes/ca.key"
      content = tls_private_key.kubernetes-key["kubernetes-ca"].private_key_pem
    })
  }

  part {
    filename     = "etcd.key"
    content_type = "text/cloud-config"
    content      = templatefile("cloud-init/parts/write_file.yaml", {
      path = "/etc/kubernetes/ca.crt"
      content = tls_self_signed_cert.kubernetes-ca.cert_pem
    })
  }
}
