import os
import yaml
from jinja2 import Environment, FileSystemLoader

# --- Path Setup ---
BASE_DIR = os.path.dirname(os.path.abspath(__file__))
CONFIG_FILE = os.path.join(BASE_DIR, "cloudflare_config.yaml")
TEMPLATE_DIR = os.path.join(BASE_DIR, "terraform", "tf.j2")
OUTPUT_DIR = os.path.join(BASE_DIR, "terraform", "output")

# --- Create Output Directory ---
os.makedirs(OUTPUT_DIR, exist_ok=True)

# --- Load YAML Config ---
with open(CONFIG_FILE, "r") as f:
    config = yaml.safe_load(f)

# --- Setup Jinja2 ---
env = Environment(loader=FileSystemLoader(TEMPLATE_DIR))

# --- Render Each .j2 Template ---
for template_name in os.listdir(TEMPLATE_DIR):
    if template_name.endswith(".j2"):
        template = env.get_template(template_name)
        rendered_output = template.render(config)

        output_path = os.path.join(OUTPUT_DIR, template_name.replace(".j2", ""))
        with open(output_path, "w") as out_file:
            out_file.write(rendered_output)

print("✅ Terraform files generated in: terraform/output/")
