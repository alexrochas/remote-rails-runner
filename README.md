# Run Rails Script in Kubernetes Pod

This repository provides a simple function to run a Ruby script inside a Kubernetes pod using `kubectl exec`
and `rails runner`. The function is designed to be sourced into your shell environment for quick access via an alias.

## Installation

Follow these steps to install and use the function in your terminal:

### Step 1: Source the Function in Your `.zshrc`

To use the function from your terminal, you need to source it in your `.zshrc` file. This can be done by adding the
following line to the end of your `.zshrc`:

```bash
echo "source $(pwd)/remote_rails_runner.sh" >> ~/.zshrc
```

This will automatically load the function every time you start a new terminal session.

Alternatively, you can manually add this line to `.zshrc`:

```bash
source /path/to/your/repo/remote_rails_runner.sh
```

Replace `/path/to/your/repo/` with the actual path where you cloned the repository.

### Step 2: Reload Your Shell

After updating `.zshrc`, you need to reload it:

```bash
source ~/.zshrc
```

### Step 3: Usage

You can now use the `remote-rails-runner` alias to run your Ruby script inside a Kubernetes pod. The alias takes two
arguments: the path to the Ruby script and the name of the Kubernetes pod.

#### Example:

```bash
remote-rails-runner /path/to/my_script.rb <pod_name>
```

- **`/path/to/my_script.rb`**: Path to the Ruby script on your local machine.
- **`<pod_name>`**: Name of the Kubernetes pod where you want to run the script.

This will read the Ruby script from your local machine and execute it in the Rails context inside the specified pod
using `rails runner`.
