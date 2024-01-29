# Q1 
## Answer = --rm
# Q2
## Answer = 0.42.0
# Q3
## Answer = 15612
```
select 
 COUNT(1)
from 
trip_data_table t
where
DATE(t.lpep_dropoff_datetime) = '2019-09-18'
AND
DATE(t.lpep_pickup_datetime) = '2019-09-18'
;

```

# Q4 
## Answer = 2019-09-26
```
select
	
	t.lpep_pickup_datetime
from 
	trip_data_table t
order by 
	t.trip_distance
desc
;
```
# Q5 
## Answer = "Brooklyn" "Manhattan" "Queens"

# Q6 
## Answer = Long Island City/Queens Plaza
```
SELECT
	t.lpep_pickup_datetime,
	t.tip_amount,
	p."Zone"
FROM
    trip_data_table t,
	taxi_zone_table p
where
	t."PULocationID" = p."LocationID"
and
	p."Zone" = 'Astoria'
and 
	EXTRACT(YEAR from t.lpep_pickup_datetime) = '2019'
and 
	EXTRACT(MONTH from t.lpep_pickup_datetime) = '09'
ORDER BY
	t.tip_amount
DESC
;
```
# Q7: Terraform output

```
Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_redshift_cluster.first_redshift_cluster will be created
  + resource "aws_redshift_cluster" "first_redshift_cluster" {
      + allow_version_upgrade               = true
      + apply_immediately                   = false
      + aqua_configuration_status           = (known after apply)
      + arn                                 = (known after apply)
      + automated_snapshot_retention_period = 1
      + availability_zone                   = (known after apply)
      + cluster_identifier                  = "tf-faran-redshift-cluster"
      + cluster_namespace_arn               = (known after apply)
      + cluster_nodes                       = (known after apply)
      + cluster_parameter_group_name        = (known after apply)
      + cluster_public_key                  = (known after apply)
      + cluster_revision_number             = (known after apply)
      + cluster_subnet_group_name           = (known after apply)
      + cluster_type                        = "single-node"
      + cluster_version                     = "1.0"
      + database_name                       = "faran_first_db"
      + default_iam_role_arn                = (known after apply)
      + dns_name                            = (known after apply)
      + encrypted                           = false
      + endpoint                            = (known after apply)
      + enhanced_vpc_routing                = (known after apply)
      + final_snapshot_identifier           = "farabutt"
      + iam_roles                           = (known after apply)
      + id                                  = (known after apply)
      + kms_key_id                          = (known after apply)
      + maintenance_track_name              = "current"
      + manual_snapshot_retention_period    = -1
      + master_password                     = (sensitive value)
      + master_password_secret_arn          = (known after apply)
      + master_password_secret_kms_key_id   = (known after apply)
      + master_username                     = "faranbutt"
      + node_type                           = "dc2.large"
      + number_of_nodes                     = 1
      + port                                = 5439
      + preferred_maintenance_window        = (known after apply)
      + publicly_accessible                 = true
      + skip_final_snapshot                 = false
      + tags_all                            = (known after apply)
      + vpc_security_group_ids              = (known after apply)
    }

  # aws_s3_bucket.first-bucket will be created
  + resource "aws_s3_bucket" "first-bucket" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "farans-bucket-1"
      + bucket_domain_name          = (known after apply)
      + bucket_prefix               = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags                        = {
          + "Environment" = "Dev"
          + "Name"        = "Faran First Bucket"
        }
      + tags_all                    = {
          + "Environment" = "Dev"
          + "Name"        = "Faran First Bucket"
        }
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)
    }

  # aws_s3_bucket_lifecycle_configuration.bucket_config will be created
  + resource "aws_s3_bucket_lifecycle_configuration" "bucket_config" {
      + bucket = (known after apply)
      + id     = (known after apply)

      + rule {
          + id     = "log"
          + status = "Enabled"

          + expiration {
              + days                         = 1
              + expired_object_delete_marker = (known after apply)
            }

          + filter {
              + and {
                  + object_size_greater_than = 400
                  + object_size_less_than    = 64000
                  + prefix                   = "log/"
                  + tags                     = {
                      + "autoclean" = "true"
                      + "rule"      = "log"
                    }
                }
            }
        }
    }

Plan: 3 to add, 0 to change, 0 to destroy.

──────────────────────────────────────────────────────────────────────────

Note: You didn't use the -out option to save this plan, so Terraform can't
guarantee to take exactly these actions if you run "terraform apply" now.
@zeeshan1122334455 ➜ /workspaces/Data-Engineering-Zoomcamp/hw_1 (main) $ terraform apply

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_redshift_cluster.first_redshift_cluster will be created
  + resource "aws_redshift_cluster" "first_redshift_cluster" {
      + allow_version_upgrade               = true
      + apply_immediately                   = false
      + aqua_configuration_status           = (known after apply)
      + arn                                 = (known after apply)
      + automated_snapshot_retention_period = 1
      + availability_zone                   = (known after apply)
      + cluster_identifier                  = "tf-faran-redshift-cluster"
      + cluster_namespace_arn               = (known after apply)
      + cluster_nodes                       = (known after apply)
      + cluster_parameter_group_name        = (known after apply)
      + cluster_public_key                  = (known after apply)
      + cluster_revision_number             = (known after apply)
      + cluster_subnet_group_name           = (known after apply)
      + cluster_type                        = "single-node"
      + cluster_version                     = "1.0"
      + database_name                       = "faran_first_db"
      + default_iam_role_arn                = (known after apply)
      + dns_name                            = (known after apply)
      + encrypted                           = false
      + endpoint                            = (known after apply)
      + enhanced_vpc_routing                = (known after apply)
      + final_snapshot_identifier           = "farabutt"
      + iam_roles                           = (known after apply)
      + id                                  = (known after apply)
      + kms_key_id                          = (known after apply)
      + maintenance_track_name              = "current"
      + manual_snapshot_retention_period    = -1
      + master_password                     = (sensitive value)
      + master_password_secret_arn          = (known after apply)
      + master_password_secret_kms_key_id   = (known after apply)
      + master_username                     = "faranbutt"
      + node_type                           = "dc2.large"
      + number_of_nodes                     = 1
      + port                                = 5439
      + preferred_maintenance_window        = (known after apply)
      + publicly_accessible                 = true
      + skip_final_snapshot                 = false
      + tags_all                            = (known after apply)
      + vpc_security_group_ids              = (known after apply)
    }

  # aws_s3_bucket.first-bucket will be created
  + resource "aws_s3_bucket" "first-bucket" {
      + acceleration_status         = (known after apply)
      + acl                         = (known after apply)
      + arn                         = (known after apply)
      + bucket                      = "farans-bucket-1"
      + bucket_domain_name          = (known after apply)
      + bucket_prefix               = (known after apply)
      + bucket_regional_domain_name = (known after apply)
      + force_destroy               = false
      + hosted_zone_id              = (known after apply)
      + id                          = (known after apply)
      + object_lock_enabled         = (known after apply)
      + policy                      = (known after apply)
      + region                      = (known after apply)
      + request_payer               = (known after apply)
      + tags                        = {
          + "Environment" = "Dev"
          + "Name"        = "Faran First Bucket"
        }
      + tags_all                    = {
          + "Environment" = "Dev"
          + "Name"        = "Faran First Bucket"
        }
      + website_domain              = (known after apply)
      + website_endpoint            = (known after apply)
    }

  # aws_s3_bucket_lifecycle_configuration.bucket_config will be created
  + resource "aws_s3_bucket_lifecycle_configuration" "bucket_config" {
      + bucket = (known after apply)
      + id     = (known after apply)

      + rule {
          + id     = "log"
          + status = "Enabled"

          + expiration {
              + days                         = 1
              + expired_object_delete_marker = (known after apply)
            }

          + filter {
              + and {
                  + object_size_greater_than = 400
                  + object_size_less_than    = 64000
                  + prefix                   = "log/"
                  + tags                     = {
                      + "autoclean" = "true"
                      + "rule"      = "log"
                    }
                }
            }
        }
    }

Plan: 3 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_redshift_cluster.first_redshift_cluster: Creating...
aws_s3_bucket.first-bucket: Creating...
aws_s3_bucket.first-bucket: Creation complete after 2s [id=farans-bucket-1]
aws_s3_bucket_lifecycle_configuration.bucket_config: Creating...
aws_redshift_cluster.first_redshift_cluster: Still creating... [10s elapsed]
aws_s3_bucket_lifecycle_configuration.bucket_config: Still creating... [10s elapsed]
aws_redshift_cluster.first_redshift_cluster: Still creating... [20s elapsed]
aws_s3_bucket_lifecycle_configuration.bucket_config: Still creating... [20s elapsed]
aws_redshift_cluster.first_redshift_cluster: Still creating... [30s elapsed]
aws_s3_bucket_lifecycle_configuration.bucket_config: Still creating... [30s elapsed]
aws_s3_bucket_lifecycle_configuration.bucket_config: Creation complete after 31s [id=farans-bucket-1]
aws_redshift_cluster.first_redshift_cluster: Still creating... [40s elapsed]
aws_redshift_cluster.first_redshift_cluster: Still creating... [50s elapsed]
aws_redshift_cluster.first_redshift_cluster: Still creating... [1m0s elapsed]
aws_redshift_cluster.first_redshift_cluster: Still creating... [1m10s elapsed]
aws_redshift_cluster.first_redshift_cluster: Creation complete after 1m13s [id=tf-faran-redshift-cluster]

Apply complete! Resources: 3 added, 0 changed, 0 destroyed.
```

# Terraform Destroy Output

```
aws_s3_bucket.first-bucket: Refreshing state... [id=farans-bucket-1]
aws_redshift_cluster.first_redshift_cluster: Refreshing state... [id=tf-faran-redshift-cluster]
aws_s3_bucket_lifecycle_configuration.bucket_config: Refreshing state... [id=farans-bucket-1]

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # aws_redshift_cluster.first_redshift_cluster will be destroyed
  - resource "aws_redshift_cluster" "first_redshift_cluster" {
      - allow_version_upgrade                = true -> null
      - apply_immediately                    = false -> null
      - aqua_configuration_status            = "auto" -> null
      - arn                                  = "arn:aws:redshift:ap-south-1:905418282988:cluster:tf-faran-redshift-cluster" -> null
      - automated_snapshot_retention_period  = 1 -> null
      - availability_zone                    = "ap-south-1a" -> null
      - availability_zone_relocation_enabled = false -> null
      - cluster_identifier                   = "tf-faran-redshift-cluster" -> null
      - cluster_namespace_arn                = "arn:aws:redshift:ap-south-1:905418282988:namespace:899def39-a188-4f56-9a54-7f8bb972b3a8" -> null
      - cluster_nodes                        = [
          - {
              - node_role          = "SHARED"
              - private_ip_address = "172.31.43.162"
              - public_ip_address  = "3.110.242.133"
            },
        ] -> null
      - cluster_parameter_group_name         = "default.redshift-1.0" -> null
      - cluster_public_key                   = <<-EOT
            ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC40kNUpklmiCEHzAUx9Nk/DLVSPMz4jwP8dUq+7oCtbZRI5HqN8bDumI9ojSEjVLnYX4pCQppjKMVkGaygFKjqcI+6SGWC7yAM15pQmKMxrAw1uPEHqaTRu+oygxyO8gY30IF4Q1GRpH9hxua/01rF7wtoLGXHQ16PfSTyqzv0CFmp5I6S7PXny4I55axjYIgjdTjjSuZfUUtK2xiT/1B6jd5uqCS8rTCQSTCUdkpNLoTWuzH/WR+SIZ/CHvwYvkuAwKWUBMMQhWObUxy4O2og8q0h5NBtAGZqNP88oJPl6IEBft75AXSuj6zsAbnhYrDkkALsWCcCoVufv5uVk/BV Amazon-Redshift
        EOT -> null
      - cluster_revision_number              = "61678" -> null
      - cluster_subnet_group_name            = "default" -> null
      - cluster_type                         = "single-node" -> null
      - cluster_version                      = "1.0" -> null
      - database_name                        = "faran_first_db" -> null
      - dns_name                             = "tf-faran-redshift-cluster.cbqji94wyt39.ap-south-1.redshift.amazonaws.com" -> null
      - encrypted                            = false -> null
      - endpoint                             = "tf-faran-redshift-cluster.cbqji94wyt39.ap-south-1.redshift.amazonaws.com:5439" -> null
      - enhanced_vpc_routing                 = false -> null
      - final_snapshot_identifier            = "farabutt" -> null
      - iam_roles                            = [] -> null
      - id                                   = "tf-faran-redshift-cluster" -> null
      - maintenance_track_name               = "current" -> null
      - manual_snapshot_retention_period     = -1 -> null
      - master_password                      = (sensitive value) -> null
      - master_username                      = "faranbutt" -> null
      - node_type                            = "dc2.large" -> null
      - number_of_nodes                      = 1 -> null
      - port                                 = 5439 -> null
      - preferred_maintenance_window         = "sun:05:00-sun:05:30" -> null
      - publicly_accessible                  = true -> null
      - skip_final_snapshot                  = false -> null
      - tags                                 = {} -> null
      - tags_all                             = {} -> null
      - vpc_security_group_ids               = [
          - "sg-08da07b22932163ac",
        ] -> null

      - logging {
          - enable      = false -> null
          - log_exports = [] -> null
        }
    }

  # aws_s3_bucket.first-bucket will be destroyed
  - resource "aws_s3_bucket" "first-bucket" {
      - arn                         = "arn:aws:s3:::farans-bucket-1" -> null
      - bucket                      = "farans-bucket-1" -> null
      - bucket_domain_name          = "farans-bucket-1.s3.amazonaws.com" -> null
      - bucket_regional_domain_name = "farans-bucket-1.s3.ap-south-1.amazonaws.com" -> null
      - force_destroy               = false -> null
      - hosted_zone_id              = "Z11RGJOFQNVJUP" -> null
      - id                          = "farans-bucket-1" -> null
      - object_lock_enabled         = false -> null
      - region                      = "ap-south-1" -> null
      - request_payer               = "BucketOwner" -> null
      - tags                        = {
          - "Environment" = "Dev"
          - "Name"        = "Faran First Bucket"
        } -> null
      - tags_all                    = {
          - "Environment" = "Dev"
          - "Name"        = "Faran First Bucket"
        } -> null

      - grant {
          - id          = "1042982408d0eb6f20d920f72ea756acccb941963b60d3d536ff988125f426e6" -> null
          - permissions = [
              - "FULL_CONTROL",
            ] -> null
          - type        = "CanonicalUser" -> null
        }

      - lifecycle_rule {
          - abort_incomplete_multipart_upload_days = 0 -> null
          - enabled                                = true -> null
          - id                                     = "log" -> null
          - prefix                                 = "log/" -> null
          - tags                                   = {
              - "autoclean" = "true"
              - "rule"      = "log"
            } -> null

          - expiration {
              - days                         = 1 -> null
              - expired_object_delete_marker = false -> null
            }
        }

      - server_side_encryption_configuration {
          - rule {
              - bucket_key_enabled = false -> null

              - apply_server_side_encryption_by_default {
                  - sse_algorithm = "AES256" -> null
                }
            }
        }

      - versioning {
          - enabled    = false -> null
          - mfa_delete = false -> null
        }
    }

  # aws_s3_bucket_lifecycle_configuration.bucket_config will be destroyed
  - resource "aws_s3_bucket_lifecycle_configuration" "bucket_config" {
      - bucket = "farans-bucket-1" -> null
      - id     = "farans-bucket-1" -> null

      - rule {
          - id     = "log" -> null
          - status = "Enabled" -> null

          - expiration {
              - days                         = 1 -> null
              - expired_object_delete_marker = false -> null
            }

          - filter {
              - and {
                  - object_size_greater_than = 400 -> null
                  - object_size_less_than    = 64000 -> null
                  - prefix                   = "log/" -> null
                  - tags                     = {
                      - "autoclean" = "true"
                      - "rule"      = "log"
                    } -> null
                }
            }
        }
    }

Plan: 0 to add, 0 to change, 3 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

aws_s3_bucket_lifecycle_configuration.bucket_config: Destroying... [id=farans-bucket-1]
aws_redshift_cluster.first_redshift_cluster: Destroying... [id=tf-faran-redshift-cluster]
aws_s3_bucket_lifecycle_configuration.bucket_config: Destruction complete after 1s
aws_s3_bucket.first-bucket: Destroying... [id=farans-bucket-1]
aws_s3_bucket.first-bucket: Destruction complete after 0s
aws_redshift_cluster.first_redshift_cluster: Still destroying... [id=tf-faran-redshift-cluster, 10s elapsed]
aws_redshift_cluster.first_redshift_cluster: Still destroying... [id=tf-faran-redshift-cluster, 20s elapsed]
aws_redshift_cluster.first_redshift_cluster: Still destroying... [id=tf-faran-redshift-cluster, 30s elapsed]
aws_redshift_cluster.first_redshift_cluster: Still destroying... [id=tf-faran-redshift-cluster, 40s elapsed]
aws_redshift_cluster.first_redshift_cluster: Still destroying... [id=tf-faran-redshift-cluster, 50s elapsed]
aws_redshift_cluster.first_redshift_cluster: Still destroying... [id=tf-faran-redshift-cluster, 1m1s elapsed]
aws_redshift_cluster.first_redshift_cluster: Still destroying... [id=tf-faran-redshift-cluster, 1m11s elapsed]
aws_redshift_cluster.first_redshift_cluster: Still destroying... [id=tf-faran-redshift-cluster, 1m21s elapsed]
aws_redshift_cluster.first_redshift_cluster: Still destroying... [id=tf-faran-redshift-cluster, 1m31s elapsed]
aws_redshift_cluster.first_redshift_cluster: Still destroying... [id=tf-faran-redshift-cluster, 1m41s elapsed]
aws_redshift_cluster.first_redshift_cluster: Still destroying... [id=tf-faran-redshift-cluster, 1m51s elapsed]
aws_redshift_cluster.first_redshift_cluster: Still destroying... [id=tf-faran-redshift-cluster, 2m1s elapsed]
aws_redshift_cluster.first_redshift_cluster: Still destroying... [id=tf-faran-redshift-cluster, 2m11s elapsed]
aws_redshift_cluster.first_redshift_cluster: Destruction complete after 2m16s

Destroy complete! Resources: 3 destroyed.
```




