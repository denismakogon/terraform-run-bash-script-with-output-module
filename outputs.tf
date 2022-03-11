output "output_result" {
  value = data.external.script_with_output.result[var.result_key]
}
