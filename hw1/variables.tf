variable "region" {
  description = "Region"
  default     = "ap-south-1"
}
variable "access_key" {
  description = "Access Key"
  type        = string
  default     = "<My-access-id>"
}
variable "secret_key" {
  description = "Secret Key"
  type        = string
  default     = "<My-secret-key>"

}
variable "max-file-size" {
  description = "Max File Size"
  default     = 64000
}

variable "min-file-size" {
  description = "Min File Size"
  default     = 400
}


variable "bucket_name" {
  description = "Bucket Name"
  default     = "farans-bucket-1"
}

variable "bucket-config-id" {
  description = "Id for Bucket Config"
  default     = "log"
}
variable "bucket-status" {
  description = "Status of Bucket"
  default     = "Enabled"
}
variable "bucket-expiry" {
  description = "Expire bucket after no of days"
  default     = 1
}


variable "cluster-id" {
  description = "Redshift Cluster Id"
  default     = "tf-faran-redshift-cluster"
}
variable "db-name" {
  description = "Name of Database"
  default     = "faran_first_db"
}

variable "db-username" {
  description = "Username of Database"
  default     = "faranbutt"
}

variable "db-password" {
  description = "Password of Database"
  default     = "BUtt1234"
}

variable "cluster-node-type" {
  description = "Type of Node in cluster"
  default     = "dc2.large"
}

variable "cluster-type" {
  description = "Type of Cluster"
  default     = "single-node"
}

variable "final-snapshot-id" {
  description = "Id of final snapshot"
  default     = "farabutt"
}
