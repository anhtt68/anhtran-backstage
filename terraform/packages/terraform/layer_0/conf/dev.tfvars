project = "backstage-poc"
vpc = {
  backstage-poc-vpc = {
    vpc_cidr_block  = "10.30.0.0/16"
    public_subnets  = ["10.30.0.0/20", "10.30.16.0/20"]
    private_subnets = ["10.30.32.0/20", "10.30.64.0/20"]
  }
}