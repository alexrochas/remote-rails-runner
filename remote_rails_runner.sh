# Function to run a local Ruby script in a Kubernetes pod using rails runner
function run_script_in_pod() {
  local script_path=$1
  local pod_name=$2

  # Check if script path is provided
  if [ -z "$script_path" ]; then
    echo "Usage: run_script_in_pod <path_to_script> <pod_name>"
    return 1
  fi

  # Check if pod name is provided
  if [ -z "$pod_name" ]; then
    echo "Usage: run_script_in_pod <path_to_script> <pod_name>"
    return 1
  fi

  # Check if file exists
  if [ ! -f "$script_path" ]; then
    echo "File not found: $script_path"
    return 1
  fi

  # Run the script inside the pod using kubectl exec
  cat "$script_path" | kubectl exec -i "$pod_name" -- rails runner -
}

# Alias to make it shorter to use
alias remote-rails-runner="run_script_in_pod"
