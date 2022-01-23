# terraform

Using  Terraform to handling the infrastructure.

## Usage - How to rotate EC2 instance
#### 1. Initial terraform
TBA

#### 2. Apply changes
TBA

#### 3. mount disk
```shell
sudo mkdir -m 777 /new_disk
sudo mount /dev/nvme1n1 /new_disk
```

#### 4. add Gitlab SSH
follow [here](https://wiki.healthcareit.net/display/IHDP/Forward+X+Window+to+Local+Machine+Setup#ForwardXWindowtoLocalMachineSetup-GitandGitLab) to create SSH for instance and add the key to Gitlab

## Command

### init 
Prepare your working directory for other commands

### plan
Show changes required by the current configuration

### apply
Create or update infrastructure

**Note: For more details see [doc](https://www.terraform.io/docs/cli/commands/index.html)** 
