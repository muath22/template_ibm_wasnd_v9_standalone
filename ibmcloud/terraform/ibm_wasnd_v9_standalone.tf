# =================================================================
# Copyright 2017 IBM Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
#	you may not use this file except in compliance with the License.
#	You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
#	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# =================================================================

# This is a terraform generated template generated from ibm_wasnd_v9_standalone

##############################################################
# Keys - CAMC (public/private) & optional User Key (public)
##############################################################
variable "ibm_pm_public_ssh_key_name" {
  description = "Public CAMC SSH key name used to connect to the virtual guest."
}

variable "ibm_pm_private_ssh_key" {
  description = "Private CAMC SSH key (base64 encoded) used to connect to the virtual guest."
}

variable "user_public_ssh_key" {
  type        = "string"
  description = "User defined public SSH key used to connect to the virtual machine. The format must be in openSSH."
  default     = "None"
}

variable "ibm_stack_id" {
  description = "A unique stack id."
}

##############################################################
# Define the ibm provider
##############################################################
#define the ibm provider
provider "ibm" {
  version = "~> 0.7"
}

provider "camc" {
  version = "~> 0.2"
}

provider "ucd" {
  username       = "${var.ucd_user}"
  password       = "${var.ucd_password}"
  ucd_server_url = "${var.ucd_server_url}"
}

##############################################################
# Reference public key in Devices>Manage>SSH Keys in SL console)
##############################################################
data "ibm_compute_ssh_key" "ibm_pm_public_key" {
  label       = "${var.ibm_pm_public_ssh_key_name}"
  most_recent = "true"
}

##############################################################
# Define pattern variables
##############################################################
##### unique stack name #####
variable "ibm_stack_name" {
  description = "A unique stack name."
}

##### Environment variables #####
#Variable : ibm_im_repo
variable "ibm_im_repo" {
  type        = "string"
  description = "IBM Software  Installation Manager Repository URL (https://<hostname/IP>:<port>/IMRepo) "
}

#Variable : ibm_im_repo_password
variable "ibm_im_repo_password" {
  type        = "string"
  description = "IBM Software  Installation Manager Repository Password"
}

#Variable : ibm_im_repo_user
variable "ibm_im_repo_user" {
  type        = "string"
  description = "IBM Software  Installation Manager Repository username"
  default     = "repouser"
}

#Variable : ibm_pm_access_token
variable "ibm_pm_access_token" {
  type        = "string"
  description = "IBM Pattern Manager Access Token"
}

#Variable : ibm_pm_service
variable "ibm_pm_service" {
  type        = "string"
  description = "IBM Pattern Manager Service"
}

#Variable : ibm_sw_repo
variable "ibm_sw_repo" {
  type        = "string"
  description = "IBM Software Repo Root (https://<hostname>:<port>)"
}

#Variable : ibm_sw_repo_password
variable "ibm_sw_repo_password" {
  type        = "string"
  description = "IBM Software Repo Password"
}

#Variable : ibm_sw_repo_user
variable "ibm_sw_repo_user" {
  type        = "string"
  description = "IBM Software Repo Username"
  default     = "repouser"
}

##### virtualmachine variables #####
#Variable : WASNode01-mgmt-network-public
variable "WASNode01-mgmt-network-public" {
  type        = "string"
  description = "Expose and use public IP of virtual machine for internal communication"
  default     = "true"
}

##### WASNode01 variables #####
#Variable : WASNode01-image
variable "WASNode01-image" {
  type        = "string"
  description = "Operating system image id / template that should be used when creating the virtual image"
  default     = "REDHAT_7_64"
}

#Variable : WASNode01-name
variable "WASNode01-name" {
  type        = "string"
  description = "Short hostname of virtual machine"
}

#Variable : WASNode01-os_admin_user
variable "WASNode01-os_admin_user" {
  type        = "string"
  description = "Name of the admin user account in the virtual machine that will be accessed via SSH"
}

#Variable : WASNode01_was_install_dir
variable "WASNode01_was_install_dir" {
  type        = "string"
  description = "The installation root directory for the WebSphere Application Server product binaries"
  default     = "/opt/IBM/WebSphere/AppServer"
}

#Variable : WASNode01_was_java_version
variable "WASNode01_was_java_version" {
  type        = "string"
  description = "The Java SDK version that should be installed with the WebSphere Application Server. Example format is 8.0.4.70"
  default     = "8.0.5.17"
}

#Variable : WASNode01_was_os_users_was_gid
variable "WASNode01_was_os_users_was_gid" {
  type        = "string"
  description = "Operating system group name that will be assigned to the product installation"
  default     = "wasgrp"
}

#Variable : WASNode01_was_os_users_was_home
variable "WASNode01_was_os_users_was_home" {
  type        = "string"
  description = "Home directory location for operating system user that is used for product installation"
  default     = "/home/wasadmin"
}

#Variable : WASNode01_was_os_users_was_ldap_user
variable "WASNode01_was_os_users_was_ldap_user" {
  type        = "string"
  description = "A flag which indicates whether to create the WebSphere user locally, or utilize an LDAP based user"
  default     = "false"
}

#Variable : WASNode01_was_os_users_was_name
variable "WASNode01_was_os_users_was_name" {
  type        = "string"
  description = "Operating system userid that will be used to install the product. Userid will be created if it does not exist"
  default     = "wasadmin"
}

#Variable : WASNode01_was_profile_dir
variable "WASNode01_was_profile_dir" {
  type        = "string"
  description = "The directory path that contains WebSphere Application Server profiles"
  default     = "/opt/IBM/WebSphere/AppServer/profiles"
}

#Variable : WASNode01_was_profiles_standalone_profiles_standalone1_cell
variable "WASNode01_was_profiles_standalone_profiles_standalone1_cell" {
  type        = "string"
  description = "Cell name for the application server"
  default     = "cell01"
}

#Variable : WASNode01_was_profiles_standalone_profiles_standalone1_keystorepassword
variable "WASNode01_was_profiles_standalone_profiles_standalone1_keystorepassword" {
  type        = "string"
  description = "Specifies the password to use on all keystore files created during profile creation"
}

#Variable : WASNode01_was_profiles_standalone_profiles_standalone1_profile
variable "WASNode01_was_profiles_standalone_profiles_standalone1_profile" {
  type        = "string"
  description = "Application server profile name"
  default     = "AppSrv01"
}

#Variable : WASNode01_was_profiles_standalone_profiles_standalone1_server
variable "WASNode01_was_profiles_standalone_profiles_standalone1_server" {
  type        = "string"
  description = "Name of the application server"
  default     = "server1"
}

#Variable : WASNode01_was_security_admin_user
variable "WASNode01_was_security_admin_user" {
  type        = "string"
  description = "The username for securing the WebSphere adminstrative console"
  default     = "wasadmin"
}

#Variable : WASNode01_was_security_admin_user_pwd
variable "WASNode01_was_security_admin_user_pwd" {
  type        = "string"
  description = "The password for the WebSphere administrative account"
}

#Variable : WASNode01_was_version
variable "WASNode01_was_version" {
  type        = "string"
  description = "The release and fixpack level of WebSphere Application Server to be installed. Example formats are 8.5.5.12 or 9.0.0.8"
  default     = "9.0.0.8"
}

#Variable : WASNode01_was_wsadmin_standalone_jvmproperty_property_value_initial
variable "WASNode01_was_wsadmin_standalone_jvmproperty_property_value_initial" {
  type        = "string"
  description = "Minimum JVM heap size"
  default     = "256"
}

#Variable : WASNode01_was_wsadmin_standalone_jvmproperty_property_value_maximum
variable "WASNode01_was_wsadmin_standalone_jvmproperty_property_value_maximum" {
  type        = "string"
  description = "Maximum JVM heap size"
  default     = "512"
}

##### ungrouped variables #####
##### domain name #####
variable "runtime_domain" {
  description = "domain name"
  default     = "cam.ibm.com"
}

#########################################################
##### Resource : VaultItem
#########################################################

resource "camc_vaultitem" "VaultItem" {
  camc_endpoint   = "${var.ibm_pm_service}/v1/vault_item/chef"
  access_token    = "${var.ibm_pm_access_token}"
  skip_ssl_verify = true
  trace           = true

  data = <<EOT
{
  "vault_content": {
    "item": "secrets",
    "values": {},
    "vault": "${var.ibm_stack_id}"
  }
}
EOT
}

#########################################################
##### Resource : WASNode01
#########################################################

#Parameter : WASNode01_datacenter
variable "WASNode01_datacenter" {
  type        = "string"
  description = "IBMCloud datacenter where infrastructure resources will be deployed"
  default     = "dal05"
}

#Parameter : WASNode01_private_network_only
variable "WASNode01_private_network_only" {
  type        = "string"
  description = "Provision the virtual machine with only private IP"
  default     = "false"
}

#Parameter : WASNode01_number_of_cores
variable "WASNode01_number_of_cores" {
  type        = "string"
  description = "Number of CPU cores, which is required to be a positive Integer"
  default     = "2"
}

#Parameter : WASNode01_memory
variable "WASNode01_memory" {
  type        = "string"
  description = "Amount of Memory (MBs), which is required to be one or more times of 1024"
  default     = "4096"
}

#Parameter : WASNode01_network_speed
variable "WASNode01_network_speed" {
  type        = "string"
  description = "Bandwidth of network communication applied to the virtual machine"
  default     = "1000"
}

#Parameter : WASNode01_hourly_billing
variable "WASNode01_hourly_billing" {
  type        = "string"
  description = "Billing cycle: hourly billed or monthly billed"
  default     = "true"
}

#Parameter : WASNode01_dedicated_acct_host_only
variable "WASNode01_dedicated_acct_host_only" {
  type        = "string"
  description = "Shared or dedicated host, where dedicated host usually means higher performance and cost"
  default     = "false"
}

#Parameter : WASNode01_local_disk
variable "WASNode01_local_disk" {
  type        = "string"
  description = "User local disk or SAN disk"
  default     = "false"
}

variable "WASNode01_root_disk_size" {
  type        = "string"
  description = "Root Disk Size - WASNode01"
  default     = "100"
}

variable "ucd_user" {
  type = "string"
  description = "UCD User."
  default = "admin"
}

variable "ucd_password" {
  type = "string"
  description = "UCD Password."
  default = "admin"
}

variable "ucd_server_url" {
  type = "string"
  description = "UCD Server URL."
  default = "http://161.156.69.189:8080"
}

variable "WASNode01_agent_name" {
  type = "string"
  description = "Agent name"
}

variable "environment_name" {
  type = "string"
  description = "Environment name"
}

resource "ibm_compute_vm_instance" "WASNode01" {
  hostname                 = "${var.WASNode01-name}"
  os_reference_code        = "${var.WASNode01-image}"
  domain                   = "${var.runtime_domain}"
  datacenter               = "${var.WASNode01_datacenter}"
  network_speed            = "${var.WASNode01_network_speed}"
  hourly_billing           = "${var.WASNode01_hourly_billing}"
  private_network_only     = "${var.WASNode01_private_network_only}"
  cores                    = "${var.WASNode01_number_of_cores}"
  memory                   = "${var.WASNode01_memory}"
  disks                    = ["${var.WASNode01_root_disk_size}"]
  dedicated_acct_host_only = "${var.WASNode01_dedicated_acct_host_only}"
  local_disk               = "${var.WASNode01_local_disk}"
  ssh_key_ids              = ["${data.ibm_compute_ssh_key.ibm_pm_public_key.id}"]

  # Specify the ssh connection
  connection {
    user        = "${var.WASNode01-os_admin_user}"
    private_key = "${base64decode(var.ibm_pm_private_ssh_key)}"
    bastion_host        = "${var.bastion_host}"
    bastion_user        = "${var.bastion_user}"
    bastion_private_key = "${ length(var.bastion_private_key) > 0 ? base64decode(var.bastion_private_key) : var.bastion_private_key}"
    bastion_port        = "${var.bastion_port}"
    bastion_host_key    = "${var.bastion_host_key}"
    bastion_password    = "${var.bastion_password}"    
  }

  provisioner "file" {
    destination = "WASNode01_add_ssh_key.sh"

    content = <<EOF
# =================================================================
# Copyright 2017 IBM Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
#	you may not use this file except in compliance with the License.
#	You may obtain a copy of the License at
#
#	  http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
#	WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# =================================================================
#!/bin/bash

if (( $# != 2 )); then
    echo "usage: arg 1 is user, arg 2 is public key"
    exit -1
fi

userid=$1
ssh_key=$2
echo "161.156.69.189  devops" >> /etc/hosts
if [[ $ssh_key = 'None' ]]; then
  echo "skipping add, 'None' specified"
  exit 0
fi

user_home=$(eval echo "~$userid")
user_auth_key_file=$user_home/.ssh/authorized_keys
if ! [ -f $user_auth_key_file ]; then
  echo "$user_auth_key_file does not exist on this system"
  exit -1
else
  echo "user_home --> $user_home"
fi

echo $ssh_key >> $user_auth_key_file
if [ $? -ne 0 ]; then
  echo "failed to add to $user_auth_key_file"
  exit -1
else
  echo "updated $user_auth_key_file"
fi

EOF
  }

  # Execute the script remotely
  provisioner "remote-exec" {
    inline = [
      "bash -c 'chmod +x WASNode01_add_ssh_key.sh'",
      "bash -c './WASNode01_add_ssh_key.sh  \"${var.WASNode01-os_admin_user}\" \"${var.user_public_ssh_key}\">> WASNode01_add_ssh_key.log 2>&1'",
    ]
  }
  
  provisioner "ucd" {
    agent_name      = "${var.WASNode01_agent_name}.${random_id.WASNode01_agent_id.dec}"
    ucd_server_url  = "${var.ucd_server_url}"
    ucd_user        = "${var.ucd_user}"
    ucd_password    = "${var.ucd_password}"
  }
  provisioner "local-exec" {
    when = "destroy"
    command = <<EOT
    curl -k -u ${var.ucd_user}:${var.ucd_password} ${var.ucd_server_url}/cli/agentCLI?agent=${var.WASNode01_agent_name}.${random_id.WASNode01_agent_id.dec} -X DELETE
EOT
}
}

#########################################################
##### Resource : WASNode01_chef_bootstrap_comp
#########################################################

resource "camc_bootstrap" "WASNode01_chef_bootstrap_comp" {
  depends_on      = ["camc_vaultitem.VaultItem", "ibm_compute_vm_instance.WASNode01"]
  name            = "WASNode01_chef_bootstrap_comp"
  camc_endpoint   = "${var.ibm_pm_service}/v1/bootstrap/chef"
  access_token    = "${var.ibm_pm_access_token}"
  skip_ssl_verify = true
  trace           = true

  data = <<EOT
{
  "os_admin_user": "${var.WASNode01-os_admin_user}",
  "stack_id": "${var.ibm_stack_id}",
  "environment_name": "_default",
  "host_ip": "${var.WASNode01-mgmt-network-public == "false" ? ibm_compute_vm_instance.WASNode01.ipv4_address_private : ibm_compute_vm_instance.WASNode01.ipv4_address}",
  "node_name": "${var.WASNode01-name}",
  "node_attributes": {
    "ibm_internal": {
      "stack_id": "${var.ibm_stack_id}",
      "stack_name": "${var.ibm_stack_name}",
      "vault": {
        "item": "secrets",
        "name": "${var.ibm_stack_id}"
      }
    }
  }
}
EOT
}

#########################################################
##### Resource : WASNode01_was_create_standalone
#########################################################

resource "camc_softwaredeploy" "WASNode01_was_create_standalone" {
  depends_on      = ["camc_softwaredeploy.WASNode01_was_v9_install"]
  name            = "WASNode01_was_create_standalone"
  camc_endpoint   = "${var.ibm_pm_service}/v1/software_deployment/chef"
  access_token    = "${var.ibm_pm_access_token}"
  skip_ssl_verify = true
  trace           = true

  data = <<EOT
{
  "os_admin_user": "${var.WASNode01-os_admin_user}",
  "stack_id": "${var.ibm_stack_id}",
  "environment_name": "_default",
  "host_ip": "${var.WASNode01-mgmt-network-public == "false" ? ibm_compute_vm_instance.WASNode01.ipv4_address_private : ibm_compute_vm_instance.WASNode01.ipv4_address}",
  "node_name": "${var.WASNode01-name}",
  "runlist": "role[was_create_standalone]",
  "node_attributes": {
    "ibm_internal": {
      "roles": "[was_create_standalone]"
    },
    "was": {
      "profiles": {
        "standalone_profiles": {
          "standalone1": {
            "cell": "${var.WASNode01_was_profiles_standalone_profiles_standalone1_cell}",
            "profile": "${var.WASNode01_was_profiles_standalone_profiles_standalone1_profile}",
            "server": "${var.WASNode01_was_profiles_standalone_profiles_standalone1_server}"
          }
        }
      },
      "wsadmin": {
        "standalone": {
          "jvmproperty": {
            "property_value_initial": "${var.WASNode01_was_wsadmin_standalone_jvmproperty_property_value_initial}",
            "property_value_maximum": "${var.WASNode01_was_wsadmin_standalone_jvmproperty_property_value_maximum}"
          }
        }
      }
    }
  },
  "vault_content": {
    "item": "secrets",
    "values": {
      "was": {
        "profiles": {
          "standalone_profiles": {
            "standalone1": {
              "keystorepassword": "${var.WASNode01_was_profiles_standalone_profiles_standalone1_keystorepassword}"
            }
          }
        }
      }
    },
    "vault": "${var.ibm_stack_id}"
  }
}
EOT
}

#########################################################
##### Resource : WASNode01_was_v9_install
#########################################################

resource "camc_softwaredeploy" "WASNode01_was_v9_install" {
  depends_on      = ["camc_bootstrap.WASNode01_chef_bootstrap_comp"]
  name            = "WASNode01_was_v9_install"
  camc_endpoint   = "${var.ibm_pm_service}/v1/software_deployment/chef"
  access_token    = "${var.ibm_pm_access_token}"
  skip_ssl_verify = true
  trace           = true

  data = <<EOT
{
  "os_admin_user": "${var.WASNode01-os_admin_user}",
  "stack_id": "${var.ibm_stack_id}",
  "environment_name": "_default",
  "host_ip": "${var.WASNode01-mgmt-network-public == "false" ? ibm_compute_vm_instance.WASNode01.ipv4_address_private : ibm_compute_vm_instance.WASNode01.ipv4_address}",
  "node_name": "${var.WASNode01-name}",
  "runlist": "role[was_v9_install]",
  "node_attributes": {
    "ibm": {
      "im_repo": "${var.ibm_im_repo}",
      "im_repo_user": "${var.ibm_im_repo_user}",
      "sw_repo": "${var.ibm_sw_repo}",
      "sw_repo_user": "${var.ibm_sw_repo_user}"
    },
    "ibm_internal": {
      "roles": "[was_v9_install]"
    },
    "was": {
      "install_dir": "${var.WASNode01_was_install_dir}",
      "java_version": "${var.WASNode01_was_java_version}",
      "os_users": {
        "was": {
          "gid": "${var.WASNode01_was_os_users_was_gid}",
          "home": "${var.WASNode01_was_os_users_was_home}",
          "ldap_user": "${var.WASNode01_was_os_users_was_ldap_user}",
          "name": "${var.WASNode01_was_os_users_was_name}"
        }
      },
      "profile_dir": "${var.WASNode01_was_profile_dir}",
      "security": {
        "admin_user": "${var.WASNode01_was_security_admin_user}"
      },
      "version": "${var.WASNode01_was_version}"
    }
  },
  "vault_content": {
    "item": "secrets",
    "values": {
      "ibm": {
        "im_repo_password": "${var.ibm_im_repo_password}",
        "sw_repo_password": "${var.ibm_sw_repo_password}"
      },
      "was": {
        "security": {
          "admin_user_pwd": "${var.WASNode01_was_security_admin_user_pwd}"
        }
      }
    },
    "vault": "${var.ibm_stack_id}"
  }
}
EOT
}

resource "random_id" "WASNode01_agent_id" {
  byte_length = 8
}

resource "ucd_component_mapping" "Deploy_WAS_App" {
  component = "Deploy WAS App"
  description = "Deploy WAS App Component"
  parent_id = "${ucd_agent_mapping.WASNode01_agent.id}"
}

resource "ucd_resource_tree" "resource_tree" {
  base_resource_group_name = "Websphere Plant_CAM"
}

resource "ucd_environment" "environment" {
  name = "${var.environment_name}"
  application = "Plant Application"
  base_resource_group ="${ucd_resource_tree.resource_tree.id}"
}

resource "ucd_agent_mapping" "WASNode01_agent" {
  depends_on = [ "ibm_compute_vm_instance.WASNode01" ]
  description = "Agent to manage the WASNode01 server"
  agent_name = "${var.WASNode01_agent_name}.${random_id.WASNode01_agent_id.dec}"
  parent_id = "${ucd_resource_tree.resource_tree.id}"
}

resource "ucd_application_process_request" "application_process_request" {
  depends_on = ["camc_softwaredeploy.WASNode01_was_create_standalone","ucd_component_mapping.Deploy_WAS_App"]  # depends on is merged with new components
  application = "Plant Application"
  application_process = "Deploy App"
  environment = "${ucd_environment.environment.name}"
  component_version {
      component = "Deploy WAS App"
      version = "latest"
  }
}

output "WASNode01_ip" {
  value = "Private : ${ibm_compute_vm_instance.WASNode01.ipv4_address_private} & Public : ${ibm_compute_vm_instance.WASNode01.ipv4_address}"
}

output "WASNode01_name" {
  value = "${var.WASNode01-name}"
}

output "WASNode01_roles" {
  value = "was_create_standalone,was_v9_install"
}

output "stack_id" {
  value = "${var.ibm_stack_id}"
}
