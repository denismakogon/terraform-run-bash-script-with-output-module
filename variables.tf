# set of env vars that every deployment script requires
variable "script_to_execute" {
  type = list(string)
}
variable "result_key" {}
